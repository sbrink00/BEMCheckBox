//
//  File.swift
//  BEMCheckBox Demo App SwiftUI
//
//  Created by Sam Brink on 4/28/25.
//

import Foundation
import SwiftUI
import BEMCheckBox

struct BEMCheckBoxView: View {
    @ObservedObject private var settings = CheckBoxSettings.shared
    let width: CGFloat
    let height: CGFloat
    
    init(width: CGFloat = 30, height: CGFloat = 30) {
            self.width  = width
            self.height = height
        }
    
    var body: some View {
        Checkbox(
            boxType: settings.boxType,
            strokeType: settings.strokeType,
            animationDuration: settings.animationDuration,
            lineWidth: settings.lineWidth
        )
        .frame(width: width, height: height)
    }
}

struct Checkbox: UIViewRepresentable {
    var boxType: BEMCheckBox.BoxType
    var strokeType: StrokeType
    var animationDuration: CGFloat
    var lineWidth: CGFloat
    
    func makeUIView(context: Context) -> BEMCheckBox {
        BEMCheckBox(frame: .zero)
    }
    
    func updateUIView(_ box: BEMCheckBox, context: Context) {
        box.boxType = boxType
        box.animationDuration = animationDuration
        box.lineWidth = lineWidth
        
        // Setting stroke vs. fill
        box.tintColor = UIColor.lightGray
        box.onTintColor = UIColor(red: 0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1)
        switch strokeType {
        case .stroke:
            box.onFillColor = UIColor.clear
            box.onCheckColor = UIColor(red: 0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1)
        case .fill:
            box.onFillColor = UIColor(red: 0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1)
            box.onCheckColor = UIColor.white
        }
    }
}
