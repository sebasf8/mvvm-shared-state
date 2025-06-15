//
//  FeedService.swift
//  FeedsStore
//
//  Created by Sebastian Fernandez on 2025-06-14.
//

import Foundation


@MainActor final class FeedService {
    func fetchFeeds() async -> [Feed] {
        generateRandomFeeds()
    }

    func fetchFeed(id: String) async -> Feed {
        generateRandomFeeds().first { $0.id == id}!
    }

    func fetchForYouFeed() async -> [Feed] {
        generateRandomFeeds()
    }
}


extension FeedService {
    func generateRandomFeeds(count: Int = 10) -> [Feed] {
        let sampleTitles = [
            "Exploring SwiftUI", "Modular Architecture Tips", "iOS 15 Animations",
            "Async Await in Practice", "Composable Architecture Basics", "Using Combine Smartly",
            "Performance Tuning Tricks", "Handling State Effectively", "Dependency Injection Guide",
            "Building Custom Views"
        ]

        return Array(
            Set(
                (0..<count).map { index in
                    Feed(
                        title: sampleTitles.randomElement()!,
                        likes: Int.random(in: 0...500),
                        isLiked: Bool.random(),
                        comments: Int.random(in: 0...100)
                    )
                }
            )
        )
    }
}
