//
//  CheckBoxSettings.swift
//  BEMCheckBox Demo App SwiftUI
//
//  Created by Sam Brink on 4/27/25.
//

import Foundation
import BEMCheckBox

enum StrokeType: Int {
    case stroke
    case fill
}

class CheckBoxSettings: ObservableObject {
    static let shared = CheckBoxSettings()
    
    @Published var boxType:          BEMCheckBox.BoxType           = .square
    @Published var strokeType:       StrokeType                     = .stroke
    @Published var animationDuration: CGFloat                        = 0.5
    @Published var lineWidth:        CGFloat                        = 1.0
    
    var thickness: CGFloat = 0.1
    
}
