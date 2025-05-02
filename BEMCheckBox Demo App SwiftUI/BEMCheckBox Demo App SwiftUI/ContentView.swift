//
//  ContentView.swift
//  BEMCheckBox Demo App SwiftUI
//
//  Created by Sam Brink on 4/26/25.
//

import SwiftUI

struct ContentView: View {
    // @State private var selection: Int = 0
    let nTexts: Int = 30
    
    var body: some View {
        TabView() {
        //TabView(selection: $selection) {
            ListView2(texts: generateNTexts(n: nTexts))
                .tabItem {
                    Image(systemName: "bubble.left.fill")
                    Text("Texts")
                }
            
                //.tag(0)
            
            CheckBoxSettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Box settings")
                }
                //.tag(1)
        }
    }
}

#Preview {
    ContentView()
}
