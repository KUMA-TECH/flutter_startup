import Cocoa
import FlutterMacOS

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
    
//    override func applicationDidFinishLaunching(_ aNotification: Notification) {
//            // Create the SwiftUI view and set the context as the value for the managedObjectContext environment keyPath.
//            // Add `@Environment(\.managedObjectContext)` in the views that will need the context.
//            let contentView = ContentView().environment(\.managedObjectContext, persistentContainer.viewContext).frame(minWidth: 450, maxWidth: .infinity, minHeight: 400, maxHeight: .infinity)
//
//            // Create the window and set the content view.
//            window = NSWindow(
//                contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
//                styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
//                backing: .buffered, defer: false)
//            window.setFrame(CGRect(x: 10, y: 10, width: 550, height: 650), display: true)
//            window.center()
//            window.contentView = NSHostingView(rootView: contentView)
//            window.makeKeyAndOrderFront(nil)
//        }
    
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }
}
