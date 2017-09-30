all: gen/bible_pb2.py ../Bible\ Reading/generated/BibleProto.Bible.proto.swift

gen/bible_pb2.py: bible.proto
	protoc --python_out=gen  bible.proto

../Bible\ Reading/generated/BibleProto.Bible.proto.swift: bible.proto
	protoc --swift_out=../Bible\ Reading/generated  bible.proto

clean:
	rm -rf ./gen/bible_pb2.py
	rm -rf ../Bible\ Reading/generated/*
