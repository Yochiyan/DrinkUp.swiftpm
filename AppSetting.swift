//
//  File.swift
//  DrinkUp
//
//  Created by よっちゃん on 2026/01/31.
//

import Foundation
final class AppSettings: ObservableObject {
    @Published var waterPrice: Int {
        didSet {
            UserDefaults.standard.set(waterPrice, forKey: "waterPrice")
        }
    }

    init() {
        let saved = UserDefaults.standard.integer(forKey: "waterPrice")
        self.waterPrice = saved == 0 ? 120 : saved
    }
}
