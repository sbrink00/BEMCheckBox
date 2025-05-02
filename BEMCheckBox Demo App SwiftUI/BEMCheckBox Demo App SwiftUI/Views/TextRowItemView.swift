//
//  TextRowItemView.swift
//  BEMCheckBox Demo App SwiftUI
//
//  Created by Sam Brink on 4/27/25.
//

import Foundation
import SwiftUI
import BEMCheckBox
import UIKit

struct TextRowItemView: View {
    let text: TextMessage
    
    var body: some View {
        HStack {
            BEMCheckBoxView()
            Text(text.message + text.emoji)
        }
    }
}


#Preview {
    TextRowItemView(text: TextMessage())
}
