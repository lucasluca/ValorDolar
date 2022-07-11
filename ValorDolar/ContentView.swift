//
//  ContentView.swift
//  ValorDolar
//
//  Created by Lucas Mendes on 08/07/22.
//

import SwiftUI
import ServiceManagement

struct ContentView: View {
    
    @AppStorage("checkedStored") var checkedStored: String = "false"
    @State private var launchAtLogin = false {
        didSet {
            checkedStored = String(launchAtLogin)
            SMLoginItemSetEnabled(Constants.helperBundleID as CFString,
                                  launchAtLogin)
        }
    }
    
    private struct Constants {
        static let helperBundleID = "LucasMendes.AutoLauncher"
    }
    
    func signIn() {
        launchAtLogin.toggle()
    }
    
    var body: some View {
        HStack {
            Button(action: signIn) {
                Toggle("Open at login", isOn: $launchAtLogin)
                    .toggleStyle(.checkbox)
            }
            .onAppear {
                if checkedStored == "true" {
                    self.launchAtLogin = true
                } else {
                    self.launchAtLogin = false
                }
            }
            
            Spacer()
            
        }
        .padding(.leading, 15)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
