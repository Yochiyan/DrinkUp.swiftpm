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
    
    var body: some View {
        VStack(spacing: 20) {
            Text("ボトル容量を変更")
                .font(.title2)
            
            TextField("ml", text: $inputSize)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 200)
            
            Button("保存") {
                if let size = Int(inputSize) {
                    bottle.size = size
                    dismiss()
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
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
