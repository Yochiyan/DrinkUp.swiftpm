//
//  HistoryView.swift
//  DrinkUp
//
//  Created by よっちゃん on 2026/02/14.
//

import Foundation
import SwiftUI

struct HistoryView: View {
    var records: [DrinkRecord]

    var body: some View {
        NavigationStack {
            List {
                ForEach(groupedByDate(), id: \.date) { item in
                    VStack(alignment: .leading, spacing: 6) {
                        Text(item.date.formatted(date: .complete, time: .omitted))
                            .font(.headline)

                        Text("Total: \(item.total) ml")
                            .font(.title3)
                            .bold()
                    }
                    .padding(.vertical, 6)
                }
            }
            .navigationTitle("History")
        }
    }

    private func groupedByDate() -> [(date: Date, total: Int)] {
        let calendar = Calendar.current

        let grouped = Dictionary(grouping: records) {
            calendar.startOfDay(for: $0.date)
        }

        return grouped
            .map { (date: $0.key, total: $0.value.reduce(0) { $0 + $1.amount }) }
            .sorted { $0.date > $1.date }
    }
}
