import Cocoa

func writeToClipboard(_ text: String) {
    let pasteboard = NSPasteboard.general
    pasteboard.declareTypes([NSPasteboard.PasteboardType.string], owner: nil)
    pasteboard.setString(text, forType: NSPasteboard.PasteboardType.string)
    pasteboard.setString("org.nspasteboard.ConcealedType",
        forType: NSPasteboard.PasteboardType(rawValue:
            "org.nspasteboard.ConcealedType"))
}

var inputText = ""

// Wait for input from standard input (stdin). To exit press Ctrl+D
while let line = readLine() {
    inputText += line + "\n"
}

writeToClipboard(inputText)
