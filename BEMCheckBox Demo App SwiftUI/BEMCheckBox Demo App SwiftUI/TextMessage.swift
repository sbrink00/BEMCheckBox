//
//  Text.swift
//  BEMCheckBox Demo App SwiftUI
//
//  Created by Sam Brink on 4/27/25.
//

import Foundation

let emojis = ["🔞", "🦕", "🗿", "🧌"]
let messages = [
    "He's soooo old",
    "Do you want to go to jimmys?",
    "That's so stupid",
    "Stop trolling me"
]

class TextMessage: Identifiable {
    let id = UUID()
    var emoji: String
    var message: String
    
    init() {
        self.emoji = emojis.randomElement()!
        self.message = messages.randomElement()!
    }
}

func generateNTexts(n: Int) -> [TextMessage] {
    var output: [TextMessage] = []
    for _ in 0...n {
        output.append(TextMessage())
    }
    return output
}
