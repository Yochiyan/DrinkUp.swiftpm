//
//  ContentView.swift
//  How many drink water?
//
//  Created by よっちゃん on 2025/09/18.
//

import SwiftUI
import Combine
import SwiftData
struct ContentView: View {
    @StateObject private var settings = AppSettings()
    @State private var bottles: [Bottle] = []
    @State private var records: [DrinkRecord] = []
    @State private var inputSize = ""
    @State private var today = Date()
    @State private var now: Date = Date()
    @State private var showBottleEdit: Bool = false

        
    var body: some View {
        VStack(spacing: 50) {
            if let bottle = bottles.first {
                Text("Bottle size: \(bottle.size)")
                    .environment(\.locale, .current)
                    .font(.title)
                    .fontWeight(.bold)
                Button("Edit") {
                    showBottleEdit = true
                }
                .environment(\.locale, .current)
                .sheet(isPresented: $showBottleEdit) {
                    if let index = bottles.indices.first {
                        BottleEditView(bottle: $bottles[index])
                            .environmentObject(settings)
                    }
                }
                .padding()
                .background(Color.blue)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                // 今日の合計
                Text("Today's total: \(todayTotal())ml")
                    .environment(\.locale, .current)
                    .font(.headline)
                    .onReceive(Timer.publish(every: 60, on: .main, in: .common).autoconnect()) { value in
                        now = value
                        today = value // keep “today” refreshed
                    }
                
                // 累計
                let total = records.reduce(0) { $0 + $1.amount }
                Text("Total amount: \(total)ml")
                    .font(.headline)
                    .environment(\.locale, .current)
                
                // 節約額
                // 節約額
                let saving = total * settings.waterPrice / settings.vendingSize
                Text("Save: ¥\(saving)")
                    .font(.headline)
                    .environment(\.locale, .current)
                
                Button(action: {
                    let newRecord = DrinkRecord(date: Date(), amount: bottle.size)
                    records.append(newRecord)
                }) {
                    Text("DrinkUp!")
                        .font(.title2)
                        .environment(\.locale, .current)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                // 履歴リスト（簡易）
                List(records.indices.reversed(), id: \.self) { index in
                    let record = records[index]
                    VStack(alignment: .leading) {
                        Text("\(record.amount) ml")
                            .fontWeight(.bold)
                        Text(record.date.formatted(date: .abbreviated, time: .shortened))
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                
            } else {
                // 初回入力
                VStack(spacing: 30) {
                    Text("Welcome!")
                        .environment(\.locale, .current)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Prepare your bottle to start.")
                        .font(.title2)
                        .environment(\.locale, .current)
                        .padding(16)
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                        .foregroundColor(.gray)
                    
                    
                }
                .padding(80)
                .background(
                    
                    LinearGradient(
                        
                        gradient: Gradient(colors: [Color.blue, Color.white]),
                        startPoint: .top, endPoint: .bottom
                        
                    )
                    .cornerRadius(40) // ビューの角を丸くする。
                    .padding(16) // 余白を追加
                    .shadow(radius: 10) // ビューに影を追加
                )
                Text("Please fill in your bottle size.(ml)")
                    .environment(\.locale, .current)
                TextField("300", text: $inputSize)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200)
                Button("Start!") {
                    if let size = Int(inputSize) {
                        let newBottle = Bottle(size: size)
                        bottles = [newBottle]
                    }
                }
                .padding()
                .environment(\.locale, .current)
                .background(Color.blue)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .padding()
        // アプリがフォアグラウンドに戻ったら日付を更新
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            today = Date()
        }
        .onReceive(NotificationCenter.default.publisher(for: .NSCalendarDayChanged)) { _ in
            today = Date()
        }
        .onAppear {
            // If no bottle exists, keep initial state; otherwise ensure records are loaded (in-memory fallback).
        }
    }
    
    // 今日の合計を算出
    private func todayTotal() -> Int {
        let cal = Calendar.current
        let start = cal.startOfDay(for: today)
        guard let end = cal.date(byAdding: .day, value: 1, to: start) else { return 0 }
        return records
            .filter { $0.date >= start && $0.date < end }
            .reduce(0) { $0 + $1.amount }
    }
    
}
#Preview {
    ContentView()
}
