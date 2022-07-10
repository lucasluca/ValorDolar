//
//  ValorDolarApp.swift
//  ValorDolar
//
//  Created by Lucas Mendes on 08/07/22.
//

import SwiftUI

@main
struct ValorDolarApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    static private(set) var instance: AppDelegate!
    lazy var statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let menu = ApplicationMenu()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        AppDelegate.instance = self
        statusBarItem.button?.title = "Loading.."
        statusBarItem.menu = menu.createMenu()
        fetch()
        Timer.scheduledTimer(withTimeInterval: 60, repeats: true) {
            (_) in
            self.fetch()
        }
    }
    
    
    func fetch() {
        Task {
            await self.getDolarValueFromApi()
        }
    }
    
    func changeStatusBarValue(_ value: String) {
        DispatchQueue.main.async {
            if(value == "error") {
                self.statusBarItem.button?.title = "Error"
            } else {
                self.statusBarItem.button?.title = "R$ \(value)"
            }
        }
    }
    
    func getDolarValueFromApi() async {
        let url = "https://economia.awesomeapi.com.br/json/last/USD-BRL"
        let apiService = APIService(urlString: url)
        do {
            let response: EconomiaApiResponse = try await apiService.getJSON()
            let coinFloat = Float(response.usdbrl.ask) ?? 0
            let roundValue = String(format:"%.2f", coinFloat)
            changeStatusBarValue(roundValue)
        } catch {
            print("error: \(error)")
            changeStatusBarValue("error")
        }
    }
    
}
