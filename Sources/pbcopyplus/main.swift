import Cocoa

func insertToClipboard(_ text: String, typeIdentifier: String? = nil, sourceData: String? = nil) {

    let pasteboard = NSPasteboard.general
    pasteboard.clearContents()
    pasteboard.declareTypes([.string], owner: nil)
    pasteboard.setString(text, forType: .string)

    if let typeIdentifier = typeIdentifier {
        var identifier: NSPasteboard.PasteboardType?
        switch typeIdentifier {
            case "--transient":
                identifier = .init(rawValue: "org.nspasteboard.TransientType")
            case "--concealed":
                identifier = .init(rawValue: "org.nspasteboard.ConcealedType")
            case "--autogenerated":
                identifier = .init(rawValue: "org.nspasteboard.AutoGeneratedType")
            case "--source":
                identifier = .init(rawValue: "org.nspasteboard.source")
            default:
                break
        }
        if let identifier = identifier {
            if let sourceData = sourceData {
                pasteboard.setString(sourceData, forType: identifier)
            } else {
                pasteboard.setString("", forType: identifier)
            }
        }
    }
}

func printHelp() {
    print("""
    Usage: pbcopyplus [options]

    Options:
      --transient           Marks content as transient.
      --concealed           Marks content as confidential.
      --autogenerated       Marks content as auto-generated.
      --source <bundle_id>  Marks content with the specified source application.
      --help                Display help information.

    Universal Identifiers:
      transient:            org.nspasteboard.TransientType
      concealed:            org.nspasteboard.ConcealedType
      autogenerated:        org.nspasteboard.AutoGeneratedType
      source:               org.nspasteboard.source(<bundle_id>)

    See more http://nspasteboard.org
    """)
}

var input = ""

// Extracting arguments from command-line
let args = CommandLine.arguments
var typeIdentifier: String? = nil
var sourceData: String? = nil
if let index = args.firstIndex(where: {
    ["--transient", "--concealed", "--autogenerated", "--source"].contains($0) }) {
        typeIdentifier = args[index]
        if typeIdentifier == "--source", index + 1 < args.count {
            sourceData = args[index + 1]
        }
}

if args.contains("--help") {
    printHelp()
} else {
    // Wait for input from standard input (stdin). To exit press Ctrl+D
    while let line = readLine() {
        input += line + "\n"
    }

    insertToClipboard(input, typeIdentifier: typeIdentifier, sourceData: sourceData)
}