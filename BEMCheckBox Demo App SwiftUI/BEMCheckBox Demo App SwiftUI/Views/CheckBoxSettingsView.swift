//
//  CheckBoxSettingsView.swift
//  BEMCheckBox Demo App SwiftUI
//
//  Created by Sam Brink on 4/27/25.
//

import Foundation
import SwiftUI
import BEMCheckBox

struct CheckBoxSettingsView: View {
    
    private func safeAreaBottomInset() -> CGFloat {
        UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
    }
        
    var body: some View {
        VStack {
            // Text("Your Text Box Settings")
            
            SettingsTopHalfView()
                .frame(maxWidth: .infinity)
                .frame(maxHeight: .infinity)
            SettingsBottomHalfView()
                .frame(maxWidth: .infinity)
                .frame(maxHeight: .infinity)
                .background(Color(.systemBlue))
        }
        .ignoresSafeArea(edges: .top)            // …but only under the top‐notch area
        .padding(.bottom, safeAreaBottomInset())
    }
    
}

struct SettingsTopHalfView: View {
    var body: some View {
        BEMCheckBoxView(width: 70, height: 70)
    }
}

struct SettingsBottomHalfView: View {
    @State private var strokeTypeSelection = 0
    @State private var boxStyleSelection = 0
    @State private var animationDuration = 0.5
    @State private var lineWidth = 0.5
    
    let labelWidth: CGFloat = 180
    
    var body: some View {
        VStack {
            
            Spacer()
            
            // MARK: Picker hstack
            HStack {
                Spacer(minLength: 20)
                
                Picker(
                    "Stroke Type",
                    selection: Binding<StrokeType>(
                        get: { CheckBoxSettings.shared.strokeType },
                        set: { CheckBoxSettings.shared.strokeType = $0 }
                    )
                ) {
                    Text("Stroke").tag(StrokeType.stroke)
                    Text("Fill").tag(StrokeType.fill)
                }
                .pickerStyle(.segmented)
                // .padding(4)
                .background(Color.white)
                .clipShape(Capsule())
                
                Spacer(minLength: 60)
                // Spacer()
                // Spacer()
                
                Picker(
                    "Box Style",
                    selection: Binding<BEMCheckBox.BoxType>(
                        get: { CheckBoxSettings.shared.boxType },
                        set: { CheckBoxSettings.shared.boxType = $0 }
                    )
                ) {
                    Text("Circle").tag(BEMCheckBox.BoxType.circle)
                    Text("Square").tag(BEMCheckBox.BoxType.square)
                }
                .pickerStyle(.segmented)
                //.padding()
                .background(Color.white)
                .clipShape(Capsule())
                
                Spacer(minLength: 20)
            }
            
            // Spacer()
            // Spacer()
            Spacer()
            
            HStack {
                Text("Animation Duration")
                    .frame(width: labelWidth, alignment: .leading)
                Spacer(minLength: 20)

                Slider(
                    value: Binding(
                        get: { CGFloat(CheckBoxSettings.shared.animationDuration) },
                        set: { newVal in CheckBoxSettings.shared.animationDuration = CGFloat(newVal) }
                    ),
                    in: 0.5...2,
                    step: 0.1
                ){
                // this is the `label:` closure
                EmptyView()
            } minimumValueLabel: {
                Text("0.5")
            } maximumValueLabel: {
                Text("2")
            }
            .accentColor(Color.white)
            //.frame(maxWidth: .infinity)
            
        }
            .padding(.horizontal)
            Spacer()
            
            HStack {
                Text("Line width")
                    .frame(width: labelWidth, alignment: .leading)
                Slider(
                    value: Binding(
                        get: { CGFloat(CheckBoxSettings.shared.lineWidth) },
                        set: { newVal in CheckBoxSettings.shared.lineWidth = CGFloat(newVal) }
                    ),
                    in: 1...4,
                    step: 0.1
                ){
                    EmptyView()
                } minimumValueLabel: {
                    Text("1")
                } maximumValueLabel: {
                    Text("4")
                }
                //.frame(maxWidth: .infinity)
            }
            .padding(.horizontal)
            
            //TODO: Add button
            Spacer()
            Spacer()
        }
        
        // Spacer(minLength: 40)
    }
}

#Preview {
    CheckBoxSettingsView()
}
