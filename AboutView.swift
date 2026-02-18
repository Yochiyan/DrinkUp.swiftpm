//
//  About.swift
//  DrinkUp
//
//  Created by よっちゃん on 2026/02/18.
//

import Foundation
import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("About DrinkUp!")
                        .font(.largeTitle)
                        .bold()
                    
                    Divider()
                    
                    Group {
                        Text("Why I made this app")
                            .font(.headline)
                        
                        Text("DrinkUp! is designed to help people build a healthy hydration habit by consciously tracking the water they drink from their own bottle.")
                    }
                    
                    Group {
                        Text("Achievement System")
                            .font(.headline)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Label("0–499ml  : Leaf", systemImage: "leaf")
                            Label("500–799ml : Leaf Fill", systemImage: "leaf.fill")
                            Label("800–1199ml : Tree", systemImage: "tree.fill")
                            Label("1200ml+ : Trophy", systemImage: "trophy.fill")
                        }
                    }
                    
                    Group {
                        Text("About the Developer")
                            .font(.headline)
                        
                        Text("Created by よっちゃん as a Swift Student Challenge project. Focused on simple interaction and strong visual feedback.")
                    }
                }
                .padding()
            }
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
