//
//  ContentView.swift
//  ValorDolar
//
//  Created by Lucas Mendes on 08/07/22.
//

import SwiftUI
import ServiceManagement

struct ContentView: View {
    @AppStorage("checkedStored") var checkedStored: String = "true"
    @State private var checked = false
    let helperBundleIdentifier = "LucasMendes.ValorDolar"

    var body: some View {
        HStack {
            Toggle("Start at login", isOn: $checked)
                .toggleStyle(.checkbox)
                .onChange(of: checked) { value in
                    let state = SMLoginItemSetEnabled(helperBundleIdentifier as CFString, checked)
                    print("Setting is enabled \(state)")
                    checkedStored = String(value)
                }
                .onAppear {
                    if checkedStored == "true" {
                        self.checked = true
                    } else {
                        self.checked = false
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
