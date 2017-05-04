/*
 * Copyright 2014-present Facebook, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
namespace apache { namespace thrift { namespace frozen {

namespace detail {

template <class K, class V>
struct KeyExtractor {
  using KeyType = K;
  static const K& getKey(const std::pair<const K, V>& pair) {
    return pair.first;
  }

  static const std::pair<const K, V>* getPointer(
      const std::pair<const K, V>& pair) {
    return &pair;
  }

  static const std::pair<const K, V>* getPointer(const std::pair<K, V>& pair) {
    // To allow freezing from VectorAsHashMap
    return reinterpret_cast<const std::pair<const K, V>*>(&pair);
  }

  static typename Layout<K>::View getViewKey(
      const typename Layout<std::pair<const K, V>>::View& pair) {
    return pair.first();
  }
};

template <class K>
struct SelfKey {
  using KeyType = K;
  static const K& getKey(const K& item) {
    return item;
  }

  static const K* getPointer(const K& item) {
    return &item;
  }

  static typename Layout<K>::View getViewKey(
      typename Layout<K>::View itemView) {
    return itemView;
  }
};

template <class T,
          class K,
          class V,
          template <class, class, class, class> class Table>
struct MapTableLayout
    : public Table<T, std::pair<const K, V>, KeyExtractor<K, V>, K> {
  typedef Table<T, std::pair<const K, V>, KeyExtractor<K, V>, K> Base;
  typedef MapTableLayout LayoutSelf;

  class View : public Base::View {
   public:
    typedef typename Layout<K>::View key_type;
    typedef typename Layout<V>::View mapped_type;

    View() {}
    View(const LayoutSelf* layout, ViewPosition position)
        : Base::View(layout, position) {}

    mapped_type getDefault(const key_type& key,
                           mapped_type def = mapped_type()) const {
      auto found = this->find(key);
      if (found == this->end()) {
        return std::move(def);
      }
      return found->second();
    }

    folly::Optional<mapped_type> getOptional(const key_type& key) const {
      folly::Optional<mapped_type> rv;
      auto found = this->find(key);
      if (found != this->end()) {
        rv.assign(found->second());
      }
      return rv;
    }

    mapped_type at(const key_type& key) const {
      auto found = this->find(key);
      if (found == this->end()) {
        throw std::out_of_range("Key not found");
      }
      return found->second();
    }
  };

  View view(ViewPosition self) const { return View(this, self); }

  void print(std::ostream& os, int level) const override {
    Base::print(os, level);
    os << DebugLine(level) << "...viewed as a map";
  }
};

template <class T, class V, template <class, class, class, class> class Table>
struct SetTableLayout : public Table<T, V, SelfKey<V>, V> {
  typedef Table<T, V, SelfKey<V>, V> Base;

  void print(std::ostream& os, int level) const override {
    Base::print(os, level);
    os << DebugLine(level) << "...viewed as a set";
  }
};
}

template <class T>
struct Layout<T, typename std::enable_if<IsOrderedMap<T>::value>::type>
    : public detail::MapTableLayout<T,
                                    typename T::key_type,
                                    typename T::mapped_type,
                                    detail::SortedTableLayout> {};

template <class T>
struct Layout<T, typename std::enable_if<IsOrderedSet<T>::value>::type>
    : public detail::SetTableLayout<T,
                                    typename T::value_type,
                                    detail::SortedTableLayout> {};
template <class T>
struct Layout<T, typename std::enable_if<IsHashMap<T>::value>::type>
    : public detail::MapTableLayout<T,
                                    typename T::key_type,
                                    typename T::mapped_type,
                                    detail::HashTableLayout> {};

template <class T>
struct Layout<T, typename std::enable_if<IsHashSet<T>::value>::type>
    : public detail::SetTableLayout<T,
                                    typename T::value_type,
                                    detail::HashTableLayout> {};
}}}

THRIFT_DECLARE_TRAIT_TEMPLATE(IsHashMap, std::unordered_map)
THRIFT_DECLARE_TRAIT_TEMPLATE(IsHashSet, std::unordered_set)
THRIFT_DECLARE_TRAIT_TEMPLATE(IsOrderedMap, std::map)
THRIFT_DECLARE_TRAIT_TEMPLATE(IsOrderedSet, std::set)
