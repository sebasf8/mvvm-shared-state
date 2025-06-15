//
//  Feed.swift
//  FeedsStore
//
//  Created by Sebastian Fernandez on 2025-06-14.
//

import Foundation

@MainActor final class ObservableFeed: ObservableObject, Identifiable {
    nonisolated var id: String { title }
    let title: String
    @Published private(set) var isLiked: Bool
    @Published private(set) var likes: Int
    @Published private(set) var comments: Int

    init(title: String, isLiked: Bool, likes: Int, comments: Int) {
        self.title = title
        self.isLiked = isLiked
        self.likes = likes
        self.comments = comments
    }

    func like() {
        if isLiked {
            likes = max(0, likes - 1)
        } else {
            likes += 1
        }
        isLiked.toggle()
    }
}
