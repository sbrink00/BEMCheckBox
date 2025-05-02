//
//  File.swift
//  BEMCheckBox Demo App SwiftUI
//
//  Created by Sam Brink on 4/27/25.
//

import Foundation
import SwiftUI

struct ListView2: View {
    let texts: [TextMessage]
    
    var body: some View {
        VStack {
            Text("Check off texts that you think have the matching emoji!")
                .multilineTextAlignment(.center)
            List {
                ForEach(texts) { text in
                    TextRowItemView(text: text)
                }
            }
        }
    }
}

#Preview {
    ListView2(texts: generateNTexts(n: 30))
}
