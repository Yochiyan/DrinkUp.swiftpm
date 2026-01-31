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
    @StateObject private var settings = AppSettings()
    
    var body: some View {
        Form {
            Section {
                Text("ボトル容量を変更")
                    .font(.title2)
                Text("Please fill your new bottle size. (ml)")
                    .foregroundColor(.secondary)
            }

            Section("ボトル設定") {
                TextField("容量 (ml)", text: $inputSize)
                    .keyboardType(.numberPad)
            }
            .listRowBackground(Color(.systemGroupedBackground))

            Section("節約計算") {
                TextField("水1本の価格（円）", value: $settings.waterPrice, format: .number)
                    .keyboardType(.numberPad)
            }.listRowBackground(Color(.black))

            Section {
                Button("Save") {
                    if let size = Int(inputSize) {
                        bottle.size = size
                        dismiss()
                    }
                }
                .listRowBackground(Color(.blue))
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
    }
}
