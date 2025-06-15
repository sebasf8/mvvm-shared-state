//
//  Feed.swift
//  FeedsStore
//
//  Created by Sebastian Fernandez on 2025-06-14.
//

import Foundation

struct Feed {
    var id: String { title }
    let title: String
    let likes: Int
    let isLiked: Bool
    let comments: Int
}

extension Feed: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }

    static func == (lhs: Feed, rhs: Feed) -> Bool {
        lhs.title == rhs.title
    }
}
