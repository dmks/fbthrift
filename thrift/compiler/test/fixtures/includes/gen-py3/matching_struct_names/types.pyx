#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

from libcpp.memory cimport shared_ptr, make_shared, unique_ptr, make_unique
from libcpp.string cimport string
from libcpp cimport bool as cbool
from libcpp.iterator cimport inserter as cinserter
from cpython cimport bool as pbool
from libc.stdint cimport int8_t, int16_t, int32_t, int64_t, uint32_t
from cython.operator cimport dereference as deref, preincrement as inc
import thrift.py3.types
cimport thrift.py3.types
cimport thrift.py3.exceptions
from thrift.py3.types import NOTSET as __NOTSET
from thrift.py3.types cimport translate_cpp_enum_to_python
cimport thrift.py3.std_libcpp as std_libcpp
from thrift.py3.serializer cimport IOBuf
from thrift.py3.serializer import Protocol
cimport thrift.py3.serializer as serializer
from thrift.py3.serializer import deserialize, serialize
from folly.optional cimport cOptional

import sys
import itertools
from collections import Sequence, Set, Mapping, Iterable
import enum as __enum
import warnings
import builtins as _builtins
cimport module.types as _module_types
import module.types as _module_types




cdef cMyStruct _MyStruct_defaults = cMyStruct()

cdef class MyStruct(thrift.py3.types.Struct):

    def __init__(
        MyStruct self, *,
        str field=None
    ):
        self._cpp_obj = move(MyStruct._make_instance(
          NULL,
          field,
        ))

    def __call__(
        MyStruct self,
        field=__NOTSET
    ):
        changes = any((
            field is not __NOTSET,
        ))

        if not changes:
            return self

        if None is not field is not __NOTSET:
            if not isinstance(field, str):
                raise TypeError(f'field is not a { str !r}.')

        inst = <MyStruct>MyStruct.__new__(MyStruct)
        inst._cpp_obj = move(MyStruct._make_instance(
          self._cpp_obj.get(),
          field,
        ))
        return inst

    @staticmethod
    cdef unique_ptr[cMyStruct] _make_instance(
        cMyStruct* base_instance,
        object field
    ) except *:
        cdef unique_ptr[cMyStruct] c_inst
        if base_instance:
            c_inst = make_unique[cMyStruct](deref(base_instance))
        else:
            c_inst = make_unique[cMyStruct]()

        if base_instance:
            # Convert None's to default value. (or unset)
            if field is None:
                deref(c_inst).field = _MyStruct_defaults.field
                deref(c_inst).__isset.field = False
                pass
            elif field is __NOTSET:
                field = None

        if field is not None:
            deref(c_inst).field = field.encode('UTF-8')
            deref(c_inst).__isset.field = True
        # in C++ you don't have to call move(), but this doesn't translate
        # into a C++ return statement, so you do here
        return move_unique(c_inst)

    def __iter__(self):
        yield 'field', self.field

    def __bool__(self):
        return True

    @staticmethod
    cdef create(shared_ptr[cMyStruct] cpp_obj):
        inst = <MyStruct>MyStruct.__new__(MyStruct)
        inst._cpp_obj = cpp_obj
        return inst

    @property
    def field(self):

        return (<bytes>self._cpp_obj.get().field).decode('UTF-8')


    def __hash__(MyStruct self):
        if not self.__hash:
            self.__hash = hash((
            self.field,
            ))
        return self.__hash

    def __repr__(MyStruct self):
        return f'MyStruct(field={repr(self.field)})'
    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(self, other))
        if not (
                isinstance(self, MyStruct) and
                isinstance(other, MyStruct)):
            if cop == 2:  # different types are never equal
                return False
            else:         # different types are always notequal
                return True

        cdef cMyStruct cself = deref((<MyStruct>self)._cpp_obj)
        cdef cMyStruct cother = deref((<MyStruct>other)._cpp_obj)
        cdef cbool cmp = cself == cother
        if cop == 2:
            return cmp
        return not cmp

    cdef bytes _serialize(MyStruct self, proto):
        cdef string c_str
        if proto is Protocol.COMPACT:
            serializer.CompactSerialize[cMyStruct](deref(self._cpp_obj.get()), &c_str)
        elif proto is Protocol.BINARY:
            serializer.BinarySerialize[cMyStruct](deref(self._cpp_obj.get()), &c_str)
        elif proto is Protocol.JSON:
            serializer.JSONSerialize[cMyStruct](deref(self._cpp_obj.get()), &c_str)
        return <bytes> c_str

    cdef uint32_t _deserialize(MyStruct self, const IOBuf* buf, proto):
        cdef uint32_t needed
        self._cpp_obj = make_shared[cMyStruct]()
        if proto is Protocol.COMPACT:
            needed = serializer.CompactDeserialize[cMyStruct](buf, deref(self._cpp_obj.get()))
        elif proto is Protocol.BINARY:
            needed = serializer.BinaryDeserialize[cMyStruct](buf, deref(self._cpp_obj.get()))
        elif proto is Protocol.JSON:
            needed = serializer.JSONDeserialize[cMyStruct](buf, deref(self._cpp_obj.get()))
        return needed

    def __reduce__(self):
        return (deserialize, (MyStruct, serialize(self)))


cdef cCombo _Combo_defaults = cCombo()

cdef class Combo(thrift.py3.types.Struct):

    def __init__(
        Combo self, *,
        listOfOurMyStructLists=None,
        theirMyStructList=None,
        ourMyStructList=None,
        listOfTheirMyStructList=None
    ):
        self._cpp_obj = move(Combo._make_instance(
          NULL,
          listOfOurMyStructLists,
          theirMyStructList,
          ourMyStructList,
          listOfTheirMyStructList,
        ))

    def __call__(
        Combo self,
        listOfOurMyStructLists=__NOTSET,
        theirMyStructList=__NOTSET,
        ourMyStructList=__NOTSET,
        listOfTheirMyStructList=__NOTSET
    ):
        changes = any((
            listOfOurMyStructLists is not __NOTSET,

            theirMyStructList is not __NOTSET,

            ourMyStructList is not __NOTSET,

            listOfTheirMyStructList is not __NOTSET,
        ))

        if not changes:
            return self

        inst = <Combo>Combo.__new__(Combo)
        inst._cpp_obj = move(Combo._make_instance(
          self._cpp_obj.get(),
          listOfOurMyStructLists,
          theirMyStructList,
          ourMyStructList,
          listOfTheirMyStructList,
        ))
        return inst

    @staticmethod
    cdef unique_ptr[cCombo] _make_instance(
        cCombo* base_instance,
        object listOfOurMyStructLists,
        object theirMyStructList,
        object ourMyStructList,
        object listOfTheirMyStructList
    ) except *:
        cdef unique_ptr[cCombo] c_inst
        if base_instance:
            c_inst = make_unique[cCombo](deref(base_instance))
        else:
            c_inst = make_unique[cCombo]()

        if base_instance:
            # Convert None's to default value. (or unset)
            if listOfOurMyStructLists is None:
                deref(c_inst).listOfOurMyStructLists = _Combo_defaults.listOfOurMyStructLists
                deref(c_inst).__isset.listOfOurMyStructLists = False
                pass
            elif listOfOurMyStructLists is __NOTSET:
                listOfOurMyStructLists = None

            if theirMyStructList is None:
                deref(c_inst).theirMyStructList = _Combo_defaults.theirMyStructList
                deref(c_inst).__isset.theirMyStructList = False
                pass
            elif theirMyStructList is __NOTSET:
                theirMyStructList = None

            if ourMyStructList is None:
                deref(c_inst).ourMyStructList = _Combo_defaults.ourMyStructList
                deref(c_inst).__isset.ourMyStructList = False
                pass
            elif ourMyStructList is __NOTSET:
                ourMyStructList = None

            if listOfTheirMyStructList is None:
                deref(c_inst).listOfTheirMyStructList = _Combo_defaults.listOfTheirMyStructList
                deref(c_inst).__isset.listOfTheirMyStructList = False
                pass
            elif listOfTheirMyStructList is __NOTSET:
                listOfTheirMyStructList = None

        if listOfOurMyStructLists is not None:
            deref(c_inst).listOfOurMyStructLists = <vector[vector[cMyStruct]]>deref(List__List__MyStruct(listOfOurMyStructLists)._cpp_obj)
            deref(c_inst).__isset.listOfOurMyStructLists = True
        if theirMyStructList is not None:
            deref(c_inst).theirMyStructList = <vector[_module_types.cMyStruct]>deref(List__MyStruct(theirMyStructList)._cpp_obj)
            deref(c_inst).__isset.theirMyStructList = True
        if ourMyStructList is not None:
            deref(c_inst).ourMyStructList = <vector[cMyStruct]>deref(List__MyStruct(ourMyStructList)._cpp_obj)
            deref(c_inst).__isset.ourMyStructList = True
        if listOfTheirMyStructList is not None:
            deref(c_inst).listOfTheirMyStructList = <vector[vector[_module_types.cMyStruct]]>deref(List__List__MyStruct(listOfTheirMyStructList)._cpp_obj)
            deref(c_inst).__isset.listOfTheirMyStructList = True
        # in C++ you don't have to call move(), but this doesn't translate
        # into a C++ return statement, so you do here
        return move_unique(c_inst)

    def __iter__(self):
        yield 'listOfOurMyStructLists', self.listOfOurMyStructLists
        yield 'theirMyStructList', self.theirMyStructList
        yield 'ourMyStructList', self.ourMyStructList
        yield 'listOfTheirMyStructList', self.listOfTheirMyStructList

    def __bool__(self):
        return True or True or True or True

    @staticmethod
    cdef create(shared_ptr[cCombo] cpp_obj):
        inst = <Combo>Combo.__new__(Combo)
        inst._cpp_obj = cpp_obj
        return inst

    @property
    def listOfOurMyStructLists(self):

        if self.__listOfOurMyStructLists is None:
            self.__listOfOurMyStructLists = List__List__MyStruct.create(make_shared[vector[vector[cMyStruct]]](deref(self._cpp_obj).listOfOurMyStructLists))
        return self.__listOfOurMyStructLists

    @property
    def theirMyStructList(self):

        if self.__theirMyStructList is None:
            self.__theirMyStructList = List__MyStruct.create(make_shared[vector[_module_types.cMyStruct]](deref(self._cpp_obj).theirMyStructList))
        return self.__theirMyStructList

    @property
    def ourMyStructList(self):

        if self.__ourMyStructList is None:
            self.__ourMyStructList = List__MyStruct.create(make_shared[vector[cMyStruct]](deref(self._cpp_obj).ourMyStructList))
        return self.__ourMyStructList

    @property
    def listOfTheirMyStructList(self):

        if self.__listOfTheirMyStructList is None:
            self.__listOfTheirMyStructList = List__List__MyStruct.create(make_shared[vector[vector[_module_types.cMyStruct]]](deref(self._cpp_obj).listOfTheirMyStructList))
        return self.__listOfTheirMyStructList


    def __hash__(Combo self):
        if not self.__hash:
            self.__hash = hash((
            self.listOfOurMyStructLists,
            self.theirMyStructList,
            self.ourMyStructList,
            self.listOfTheirMyStructList,
            ))
        return self.__hash

    def __repr__(Combo self):
        return f'Combo(listOfOurMyStructLists={repr(self.listOfOurMyStructLists)}, theirMyStructList={repr(self.theirMyStructList)}, ourMyStructList={repr(self.ourMyStructList)}, listOfTheirMyStructList={repr(self.listOfTheirMyStructList)})'
    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(self, other))
        if not (
                isinstance(self, Combo) and
                isinstance(other, Combo)):
            if cop == 2:  # different types are never equal
                return False
            else:         # different types are always notequal
                return True

        cdef cCombo cself = deref((<Combo>self)._cpp_obj)
        cdef cCombo cother = deref((<Combo>other)._cpp_obj)
        cdef cbool cmp = cself == cother
        if cop == 2:
            return cmp
        return not cmp

    cdef bytes _serialize(Combo self, proto):
        cdef string c_str
        if proto is Protocol.COMPACT:
            serializer.CompactSerialize[cCombo](deref(self._cpp_obj.get()), &c_str)
        elif proto is Protocol.BINARY:
            serializer.BinarySerialize[cCombo](deref(self._cpp_obj.get()), &c_str)
        elif proto is Protocol.JSON:
            serializer.JSONSerialize[cCombo](deref(self._cpp_obj.get()), &c_str)
        return <bytes> c_str

    cdef uint32_t _deserialize(Combo self, const IOBuf* buf, proto):
        cdef uint32_t needed
        self._cpp_obj = make_shared[cCombo]()
        if proto is Protocol.COMPACT:
            needed = serializer.CompactDeserialize[cCombo](buf, deref(self._cpp_obj.get()))
        elif proto is Protocol.BINARY:
            needed = serializer.BinaryDeserialize[cCombo](buf, deref(self._cpp_obj.get()))
        elif proto is Protocol.JSON:
            needed = serializer.JSONDeserialize[cCombo](buf, deref(self._cpp_obj.get()))
        return needed

    def __reduce__(self):
        return (deserialize, (Combo, serialize(self)))


cdef class List__MyStruct:
    def __init__(self, items=None):
        if isinstance(items, List__MyStruct):
            self._cpp_obj = (<List__MyStruct> items)._cpp_obj
        else:
            self._cpp_obj = move(List__MyStruct._make_instance(items))

    @staticmethod
    cdef create(shared_ptr[vector[cMyStruct]] c_items):
        inst = <List__MyStruct>List__MyStruct.__new__(List__MyStruct)
        inst._cpp_obj = c_items
        return inst

    @staticmethod
    cdef unique_ptr[vector[cMyStruct]] _make_instance(object items) except *:
        cdef unique_ptr[vector[cMyStruct]] c_inst = make_unique[vector[cMyStruct]]()
        if items is not None:
            for item in items:
                if not isinstance(item, MyStruct):
                    raise TypeError(f"{item!r} is not of type 'MyStruct'")
                deref(c_inst).push_back(deref((<MyStruct>item)._cpp_obj))
        return move_unique(c_inst)

    def __add__(object self, object other):
        return type(self)(itertools.chain(self, other))

    def __getitem__(self, object index_obj):
        cdef shared_ptr[vector[cMyStruct]] c_inst
        cdef cMyStruct citem
        if isinstance(index_obj, slice):
            c_inst = make_shared[vector[cMyStruct]]()
            start_val = index_obj.start
            stop_val = index_obj.stop
            step_val = index_obj.step
            sz = deref(self._cpp_obj).size()

            if step_val == 0 or step_val is None:
                step_val = 1
            if step_val > 0:
                if start_val is None:
                    start_val = 0
                elif start_val > sz:
                    start_val = sz
                if stop_val is None:
                    stop_val = sz
                elif stop_val > sz:
                    stop_val = sz
            else:
                if start_val is None:
                    start_val = sz - 1
                elif start_val > sz - 1:
                    start_val = sz - 1
                if stop_val is None:
                    stop_val = -1
                elif stop_val > sz - 1:
                    stop_val = sz - 1

            index = start_val
            while ((step_val > 0 and index < stop_val) or
                   (step_val < 0 and index > stop_val)):
                citem = deref(self._cpp_obj.get())[index]
                deref(c_inst).push_back(citem)
                index += step_val
            return List__MyStruct.create(c_inst)
        else:
            index = <int?>index_obj
            size = len(self)
            # Convert a negative index
            if index < 0:
                index = size + index
            if index >= size or index < 0:
                raise IndexError('list index out of range')
            citem = deref(self._cpp_obj.get())[index]
            return MyStruct.create(make_shared[cMyStruct](citem))

    def __len__(self):
        return deref(self._cpp_obj).size()

    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(type(self), type(other)))
        if not (isinstance(self, Iterable) and isinstance(other, Iterable)):
            return cop != 2
        if (len(self) != len(other)):
            return cop != 2

        for one, two in zip(self, other):
            if one != two:
                return cop != 2

        return cop == 2

    def __hash__(self):
        if not self.__hash:
            self.__hash = hash(tuple(self))
        return self.__hash

    def __contains__(self, item):
        if not self:
            return False
        cdef cMyStruct citem = deref((<MyStruct>item)._cpp_obj)
        cdef vector[cMyStruct] vec = deref(
            self._cpp_obj.get())
        return std_libcpp.find(vec.begin(), vec.end(), citem) != vec.end()

    def __iter__(self):
        if not self:
            raise StopIteration
        cdef cMyStruct citem
        for citem in deref(self._cpp_obj):
            yield MyStruct.create(make_shared[cMyStruct](citem))

    def __repr__(self):
        if not self:
            return 'i[]'
        return f'i[{", ".join(map(repr, self))}]'

    def __reversed__(self):
        if not self:
            raise StopIteration
        cdef cMyStruct citem
        cdef vector[cMyStruct] vec = deref(
            self._cpp_obj.get())
        cdef vector[cMyStruct].reverse_iterator loc = vec.rbegin()
        while loc != vec.rend():
            citem = deref(loc)
            yield MyStruct.create(make_shared[cMyStruct](citem))
            inc(loc)

    def index(self, item):
        if not self:
            raise ValueError(f'{item} is not in list')
        cdef cMyStruct citem = deref((<MyStruct>item)._cpp_obj)
        cdef vector[cMyStruct] vec = deref(self._cpp_obj.get())
        cdef vector[cMyStruct].iterator loc = std_libcpp.find(vec.begin(), vec.end(), citem)
        if loc != vec.end():
            return <int64_t> std_libcpp.distance(vec.begin(), loc)
        raise ValueError(f'{item} is not in list')

    def count(self, item):
        if not self:
            return 0
        cdef cMyStruct citem = deref((<MyStruct>item)._cpp_obj)
        cdef vector[cMyStruct] vec = deref(self._cpp_obj.get())
        return <int64_t> std_libcpp.count(vec.begin(), vec.end(), citem)


Sequence.register(List__MyStruct)

cdef class List__List__MyStruct:
    def __init__(self, items=None):
        if isinstance(items, List__List__MyStruct):
            self._cpp_obj = (<List__List__MyStruct> items)._cpp_obj
        else:
            self._cpp_obj = move(List__List__MyStruct._make_instance(items))

    @staticmethod
    cdef create(shared_ptr[vector[vector[cMyStruct]]] c_items):
        inst = <List__List__MyStruct>List__List__MyStruct.__new__(List__List__MyStruct)
        inst._cpp_obj = c_items
        return inst

    @staticmethod
    cdef unique_ptr[vector[vector[cMyStruct]]] _make_instance(object items) except *:
        cdef unique_ptr[vector[vector[cMyStruct]]] c_inst = make_unique[vector[vector[cMyStruct]]]()
        if items is not None:
            for item in items:
                if item is None:
                    raise TypeError("None is not of the type _typing.Sequence['MyStruct']")
                if not isinstance(item, List__MyStruct):
                    item = List__MyStruct(item)
                deref(c_inst).push_back(vector[cMyStruct](deref(List__MyStruct(item)._cpp_obj.get())))
        return move_unique(c_inst)

    def __add__(object self, object other):
        return type(self)(itertools.chain(self, other))

    def __getitem__(self, object index_obj):
        cdef shared_ptr[vector[vector[cMyStruct]]] c_inst
        cdef vector[cMyStruct] citem
        if isinstance(index_obj, slice):
            c_inst = make_shared[vector[vector[cMyStruct]]]()
            start_val = index_obj.start
            stop_val = index_obj.stop
            step_val = index_obj.step
            sz = deref(self._cpp_obj).size()

            if step_val == 0 or step_val is None:
                step_val = 1
            if step_val > 0:
                if start_val is None:
                    start_val = 0
                elif start_val > sz:
                    start_val = sz
                if stop_val is None:
                    stop_val = sz
                elif stop_val > sz:
                    stop_val = sz
            else:
                if start_val is None:
                    start_val = sz - 1
                elif start_val > sz - 1:
                    start_val = sz - 1
                if stop_val is None:
                    stop_val = -1
                elif stop_val > sz - 1:
                    stop_val = sz - 1

            index = start_val
            while ((step_val > 0 and index < stop_val) or
                   (step_val < 0 and index > stop_val)):
                citem = deref(self._cpp_obj.get())[index]
                deref(c_inst).push_back(citem)
                index += step_val
            return List__List__MyStruct.create(c_inst)
        else:
            index = <int?>index_obj
            size = len(self)
            # Convert a negative index
            if index < 0:
                index = size + index
            if index >= size or index < 0:
                raise IndexError('list index out of range')
            citem = deref(self._cpp_obj.get())[index]
            return List__MyStruct.create(
    make_shared[vector[cMyStruct]](citem))

    def __len__(self):
        return deref(self._cpp_obj).size()

    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(type(self), type(other)))
        if not (isinstance(self, Iterable) and isinstance(other, Iterable)):
            return cop != 2
        if (len(self) != len(other)):
            return cop != 2

        for one, two in zip(self, other):
            if one != two:
                return cop != 2

        return cop == 2

    def __hash__(self):
        if not self.__hash:
            self.__hash = hash(tuple(self))
        return self.__hash

    def __contains__(self, item):
        if not self:
            return False
        cdef vector[cMyStruct] citem = vector[cMyStruct](deref(List__MyStruct(item)._cpp_obj.get()))
        cdef vector[vector[cMyStruct]] vec = deref(
            self._cpp_obj.get())
        return std_libcpp.find(vec.begin(), vec.end(), citem) != vec.end()

    def __iter__(self):
        if not self:
            raise StopIteration
        cdef vector[cMyStruct] citem
        for citem in deref(self._cpp_obj):
            yield List__MyStruct.create(
    make_shared[vector[cMyStruct]](citem))

    def __repr__(self):
        if not self:
            return 'i[]'
        return f'i[{", ".join(map(repr, self))}]'

    def __reversed__(self):
        if not self:
            raise StopIteration
        cdef vector[cMyStruct] citem
        cdef vector[vector[cMyStruct]] vec = deref(
            self._cpp_obj.get())
        cdef vector[vector[cMyStruct]].reverse_iterator loc = vec.rbegin()
        while loc != vec.rend():
            citem = deref(loc)
            yield List__MyStruct.create(
    make_shared[vector[cMyStruct]](citem))
            inc(loc)

    def index(self, item):
        if not self:
            raise ValueError(f'{item} is not in list')
        cdef vector[cMyStruct] citem = vector[cMyStruct](deref(List__MyStruct(item)._cpp_obj.get()))
        cdef vector[vector[cMyStruct]] vec = deref(self._cpp_obj.get())
        cdef vector[vector[cMyStruct]].iterator loc = std_libcpp.find(vec.begin(), vec.end(), citem)
        if loc != vec.end():
            return <int64_t> std_libcpp.distance(vec.begin(), loc)
        raise ValueError(f'{item} is not in list')

    def count(self, item):
        if not self:
            return 0
        cdef vector[cMyStruct] citem = vector[cMyStruct](deref(List__MyStruct(item)._cpp_obj.get()))
        cdef vector[vector[cMyStruct]] vec = deref(self._cpp_obj.get())
        return <int64_t> std_libcpp.count(vec.begin(), vec.end(), citem)


Sequence.register(List__List__MyStruct)
