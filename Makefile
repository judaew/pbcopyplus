.DEFAULT_GOAL := all

SWIFTC := swiftc
SWIFT_FLAGS := -sdk $(shell xcrun --show-sdk-path --sdk macosx) -framework Cocoa
SOURCE := main.swift
OUTPUT := pbcopyplus

.PHONY: all
all: $(OUTPUT)

$(OUTPUT): $(SOURCE)
	mkdir -p bin
	$(SWIFTC) $(SWIFT_FLAGS) $^ -o bin/$@

.PHONY: clean
clean:
	rm -f $(OUTPUT)
	rmdir bin
