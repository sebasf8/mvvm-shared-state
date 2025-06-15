//
//  FeedsStore.swift
//  FeedsStore
//
//  Created by Sebastian Fernandez on 2025-06-14.
//

import Foundation

@MainActor final class FeedStore {
    static let shared = FeedStore()
    private let service = FeedService()
    private var feeds: [String: ObservableFeed] = [:]

    func fetchFeeds() async -> [ObservableFeed] {
        await service.fetchFeeds().map(sharedObject)
    }

    func fetchFeed(id: String) async -> ObservableFeed {
        feeds[id]!
    }

    func fetchForYouFeed() async -> [ObservableFeed] {
        await service.fetchForYouFeed().map(sharedObject)
    }

    private func sharedObject(_ model: Feed) -> ObservableFeed {
        if let object = feeds[model.id] {
            return object
        }

        let newObject = ObservableFeed(title: model.title, isLiked: model.isLiked, likes: model.likes, comments: model.comments)
        feeds[model.id] = newObject

        return newObject
    }
}
