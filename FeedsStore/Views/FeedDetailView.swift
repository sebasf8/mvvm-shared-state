//
//  FeedDetailView.swift
//  FeedsStore
//
//  Created by Sebastian Fernandez on 2025-06-14.
//

import SwiftUI

struct FeedDetailView: View {
    @StateObject private var viewModel: FeedDetailViewModel

    init(id: String) {
        _viewModel = StateObject(wrappedValue: FeedDetailViewModel(id: id))
    }

    var body: some View {

        VStack {
            if let feed = viewModel.feed {
                VStack() {
                    Text(feed.title)
                        .font(.headline)
                    SocialToolbar(feed: feed)
                }
            } else {
                ProgressView()
            }
        }
        .task {
            await viewModel.load()
        }
    }
    
}


@MainActor final class FeedDetailViewModel: ObservableObject {
    @Published private(set) var feed: ObservableFeed?

    private let id: String

    init(id: String) {
        self.id = id
    }

    func load() async {
        print("Loading feed id: \(id)...")
        feed = await FeedStore.shared.fetchFeed(id: id)
    }
}
