all: gen/bible_pb2.py

gen/bible_pb2.py: bible.proto
	protoc --python_out=gen  bible.proto
	protoc --swift_out=../Bible\ Reading/generated  bible.proto

clean:
	rm -rf ./gen/bible_pb2.py
