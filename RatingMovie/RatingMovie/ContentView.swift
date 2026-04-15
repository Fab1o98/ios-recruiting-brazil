//
//  ContentView.swift
//  RatingMovie
//
//  Created by Fábio Ribeiro de Lima on 02/04/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var body: some View {
        MainTabView()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
