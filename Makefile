SWIFT = swiftc
SWIFT_FLAGS = -O
EXECUTABLE = pbcopyplus
SOURCES_DIR = Sources/pbcopyplus

all: $(EXECUTABLE)

$(EXECUTABLE):
	mkdir -p bin
	$(SWIFT) $(SWIFT_FLAGS) $(SOURCES_DIR)/main.swift -o bin/$(EXECUTABLE)

clean:
	rm -f bin/$(EXECUTABLE)
	rmdir bin

