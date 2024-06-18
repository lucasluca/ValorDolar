import Cocoa
import LaunchAtLogin

class ApplicationMenu {
    func createMenu() -> NSMenu {
        let menu = NSMenu()
        
        // Auto-launch checkbox
        let autoLaunchItem = NSMenuItem()
        autoLaunchItem.title = "Launch at startup"
        autoLaunchItem.state = LaunchAtLogin.isEnabled ? .on : .off
        autoLaunchItem.action = #selector(toggleAutoLaunch(_:))
        autoLaunchItem.target = self
        
        menu.addItem(autoLaunchItem)
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        
        return menu
    }
    
    @objc func toggleAutoLaunch(_ sender: NSMenuItem) {
        LaunchAtLogin.isEnabled.toggle()
        sender.state = LaunchAtLogin.isEnabled ? .on : .off
    }
}
