//
//  BottleEditView.swift
//  DrinkUp!
//
//  Created by よっちゃん on 2025/09/29.
//
import SwiftUI

struct BottleEditView: View {
    @Binding var bottle: Bottle
    @State private var inputSize: String = ""
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var settings: AppSettings
    
    var body: some View {
        Form {
            Section {
                Text("Check or change your older.")
                    .font(.title2)
                    .bold()
            }

            Section("Bottle size(ml)") {
                TextField("(ml)", text: $inputSize)
                    .keyboardType(.numberPad)
            }
            .foregroundColor(.secondary)

            Section("Vending Price(¥)") {
                TextField("",value: $settings.waterPrice, format: .number)
                    .keyboardType(.numberPad)
            } .foregroundColor(.secondary)
            
            Section("Vending size(ml)") {
                TextField("", value: $settings.vendingSize, format: .number) .keyboardType(.numberPad)
            } .foregroundColor(.secondary)

            Section {
                Button("Save") {
                    if let size = Int(inputSize) {
                        bottle.size = size
                        dismiss()
                    }
                }
                .listRowBackground(Color(red: 0/255, green: 120/255, blue: 255/255))
                .foregroundColor(Color.white)
                .bold()
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .onAppear {
            inputSize = "\(bottle.size)"
            
        }
        
    }

}
#Preview {
    BottleEditPreviewWrapper()
}

private struct BottleEditPreviewWrapper: View {
    @State private var sample = Bottle(size: 500)

    var body: some View {
        BottleEditView(bottle: $sample)
            .environmentObject(AppSettings())
    }
}

