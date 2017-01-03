# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: bible.proto

import sys
_b=sys.version_info[0]<3 and (lambda x:x) or (lambda x:x.encode('latin1'))
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
from google.protobuf import descriptor_pb2
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor.FileDescriptor(
  name='bible.proto',
  package='BibleProto',
  syntax='proto2',
  serialized_pb=_b('\n\x0b\x62ible.proto\x12\nBibleProto\"G\n\x0c\x42ibleMessage\x12\x0f\n\x07version\x18\x01 \x02(\x05\x12&\n\x05\x62ooks\x18\x02 \x03(\x0b\x32\x17.BibleProto.BookMessage\"j\n\x0b\x42ookMessage\x12\x0f\n\x07version\x18\x01 \x02(\x05\x12\r\n\x05index\x18\x02 \x01(\x05\x12\r\n\x05title\x18\x03 \x01(\t\x12,\n\x08\x63hapters\x18\x04 \x03(\x0b\x32\x1a.BibleProto.ChapterMessage\"Z\n\x0e\x43hapterMessage\x12\x0f\n\x07version\x18\x01 \x02(\x05\x12\x0e\n\x06number\x18\x02 \x01(\x05\x12\'\n\x06verses\x18\x03 \x03(\x0b\x32\x17.BibleProto.VersMessage\"=\n\x0bVersMessage\x12\x0f\n\x07version\x18\x01 \x02(\x05\x12\x0f\n\x07vnumber\x18\x02 \x01(\x05\x12\x0c\n\x04text\x18\x03 \x01(\tB\x02H\x01')
)
_sym_db.RegisterFileDescriptor(DESCRIPTOR)




_BIBLEMESSAGE = _descriptor.Descriptor(
  name='BibleMessage',
  full_name='BibleProto.BibleMessage',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='version', full_name='BibleProto.BibleMessage.version', index=0,
      number=1, type=5, cpp_type=1, label=2,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='books', full_name='BibleProto.BibleMessage.books', index=1,
      number=2, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=27,
  serialized_end=98,
)


_BOOKMESSAGE = _descriptor.Descriptor(
  name='BookMessage',
  full_name='BibleProto.BookMessage',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='version', full_name='BibleProto.BookMessage.version', index=0,
      number=1, type=5, cpp_type=1, label=2,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='index', full_name='BibleProto.BookMessage.index', index=1,
      number=2, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='title', full_name='BibleProto.BookMessage.title', index=2,
      number=3, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=_b("").decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='chapters', full_name='BibleProto.BookMessage.chapters', index=3,
      number=4, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=100,
  serialized_end=206,
)


_CHAPTERMESSAGE = _descriptor.Descriptor(
  name='ChapterMessage',
  full_name='BibleProto.ChapterMessage',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='version', full_name='BibleProto.ChapterMessage.version', index=0,
      number=1, type=5, cpp_type=1, label=2,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='number', full_name='BibleProto.ChapterMessage.number', index=1,
      number=2, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='verses', full_name='BibleProto.ChapterMessage.verses', index=2,
      number=3, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=208,
  serialized_end=298,
)


_VERSMESSAGE = _descriptor.Descriptor(
  name='VersMessage',
  full_name='BibleProto.VersMessage',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='version', full_name='BibleProto.VersMessage.version', index=0,
      number=1, type=5, cpp_type=1, label=2,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='vnumber', full_name='BibleProto.VersMessage.vnumber', index=1,
      number=2, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='text', full_name='BibleProto.VersMessage.text', index=2,
      number=3, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=_b("").decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=300,
  serialized_end=361,
)

_BIBLEMESSAGE.fields_by_name['books'].message_type = _BOOKMESSAGE
_BOOKMESSAGE.fields_by_name['chapters'].message_type = _CHAPTERMESSAGE
_CHAPTERMESSAGE.fields_by_name['verses'].message_type = _VERSMESSAGE
DESCRIPTOR.message_types_by_name['BibleMessage'] = _BIBLEMESSAGE
DESCRIPTOR.message_types_by_name['BookMessage'] = _BOOKMESSAGE
DESCRIPTOR.message_types_by_name['ChapterMessage'] = _CHAPTERMESSAGE
DESCRIPTOR.message_types_by_name['VersMessage'] = _VERSMESSAGE

BibleMessage = _reflection.GeneratedProtocolMessageType('BibleMessage', (_message.Message,), dict(
  DESCRIPTOR = _BIBLEMESSAGE,
  __module__ = 'bible_pb2'
  # @@protoc_insertion_point(class_scope:BibleProto.BibleMessage)
  ))
_sym_db.RegisterMessage(BibleMessage)

BookMessage = _reflection.GeneratedProtocolMessageType('BookMessage', (_message.Message,), dict(
  DESCRIPTOR = _BOOKMESSAGE,
  __module__ = 'bible_pb2'
  # @@protoc_insertion_point(class_scope:BibleProto.BookMessage)
  ))
_sym_db.RegisterMessage(BookMessage)

ChapterMessage = _reflection.GeneratedProtocolMessageType('ChapterMessage', (_message.Message,), dict(
  DESCRIPTOR = _CHAPTERMESSAGE,
  __module__ = 'bible_pb2'
  # @@protoc_insertion_point(class_scope:BibleProto.ChapterMessage)
  ))
_sym_db.RegisterMessage(ChapterMessage)

VersMessage = _reflection.GeneratedProtocolMessageType('VersMessage', (_message.Message,), dict(
  DESCRIPTOR = _VERSMESSAGE,
  __module__ = 'bible_pb2'
  # @@protoc_insertion_point(class_scope:BibleProto.VersMessage)
  ))
_sym_db.RegisterMessage(VersMessage)


DESCRIPTOR.has_options = True
DESCRIPTOR._options = _descriptor._ParseOptions(descriptor_pb2.FileOptions(), _b('H\001'))
# @@protoc_insertion_point(module_scope)
