.DEFAULT_GOAL := all

SWIFTC := swiftc
SWIFT_FLAGS := -sdk $(shell xcrun --show-sdk-path --sdk macosx) -framework Cocoa
SOURCE := main.swift
OUTPUT := pbcopyConcealedType

.PHONY: all
all: $(OUTPUT)

$(OUTPUT): $(SOURCE)
	$(SWIFTC) $(SWIFT_FLAGS) $^ -o $@

.PHONY: clean
clean:
	rm -f $(OUTPUT)
