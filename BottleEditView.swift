//
//  BottleEditView.swift
//  DrinkUp!
//
//  Created by よっちゃん on 2025/09/29.
//
import SwiftUI
import Foundation

extension Notification.Name {
    static let bottleDidUpdate = Notification.Name("bottleDidUpdate")
}

struct BottleEditView: View {
    @Binding var bottle: Bottle
    @State private var inputSize: String = ""
    @State private var showResetAlert: Bool = false
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var settings: AppSettings
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        Form {
            Text("Check or change your order.")
                .font(.title)
                .bold()
                .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
                .listRowBackground(Color.clear)
            
            Section("Bottle size(ml)") {
                TextField("(ml)", text: $inputSize)
                    .keyboardType(.numberPad)
                    .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
            }
            .foregroundColor(.secondary)
            .bold()
            .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
            Section("Vending Price(¥)") {
                TextField("",value: $settings.waterPrice, format: .number)
                    .keyboardType(.numberPad)
                    .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
                    .bold()
                    
            } .foregroundColor(.secondary)
            
            Section("Vending size(ml)") {
                TextField("", value: $settings.vendingSize, format: .number) .keyboardType(.numberPad)
                    .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
                    .bold()
            } .foregroundColor(.secondary)

            Section {
                Button("Save and close") {
                    if let size = Int(inputSize) {
                        bottle.size = size
                        NotificationCenter.default.post(name: .bottleDidUpdate, object: nil)
                    }
                    dismiss()
                }
                .listRowBackground(Color(red: 0/255, green: 120/255, blue: 255/255))
                .foregroundColor(Color.white)
                .bold()
                .frame(maxWidth: .infinity, alignment: .center)
            }
            Section {
                Color.clear.frame(height: 50)
                .listRowBackground(Color.clear)
            }
            Section {
                Button(role: .destructive) {
                    showResetAlert = true
                } label: {
                    Text("Reset all data")
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.red, lineWidth: 5)
                        )
                }
                .buttonStyle(.plain)
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
                .alert("Do you want to reset all data?\nThis action cannot be undone.", isPresented: $showResetAlert) {
                    Button("Cancel", role: .cancel) {}
                    Button("Continue", role: .destructive) {
                        resetAllData()
                    }
                }
            }
        }
        .onAppear {
            inputSize = "\(bottle.size)"
            
        }
        
    }
    
    private func resetAllData() {
        settings.waterPrice = 0
        settings.vendingSize = 0
        bottle.size = 0
        inputSize = ""
        dismiss()
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

