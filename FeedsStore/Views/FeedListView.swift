//
//  FeedListView.swift
//  FeedsStore
//
//  Created by Sebastian Fernandez on 2025-06-14.
//

import SwiftUI

struct FeedListView: View {
    @StateObject private var viewModel = FeedListViewViewModel()
    @State private var path: [String] = []

    var body: some View {
        let _ = Self._printChanges()

        NavigationStack(path: $path) {
            ScrollView {
                ForEach(viewModel.feeds) { feed in
                    VStack(alignment: .leading) {
                        Text(feed.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer(minLength: 12)
                        SocialToolbar(feed: feed)
                    }
                    .frame(maxWidth: .infinity)
                    .fixedSize(horizontal: false, vertical: true)
                    .contentShape(Rectangle())
                    .onTapGesture { path.append(feed.id) }

                    Divider()
                }
                .padding()
            }
            .navigationDestination(for: String.self) { id in
                FeedDetailView(id: id)
            }
        }
        .task {
            await viewModel.load()
        }
    }
}

@MainActor final class FeedListViewViewModel: ObservableObject {
    @Published private(set) var feeds: [ObservableFeed] = []

    func load() async {
        guard feeds.isEmpty else { return }

        print("Loading feeds...")
        feeds = await FeedStore.shared.fetchFeeds()
    }
}


#Preview {
    FeedListView()
}
