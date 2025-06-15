//
//  ContentView.swift
//  FeedsStore
//
//  Created by Sebastian Fernandez on 2025-06-14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Latest", systemImage: "") {
                FeedListView()
            }
            Tab("Trending", systemImage: "") {
                FeedListView()
            }
            Tab("Other", systemImage: "") {
                FeedListView()
            }
        }
    }
}

#Preview {
    ContentView()
}
