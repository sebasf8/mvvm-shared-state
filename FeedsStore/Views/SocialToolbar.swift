//
//  SocialToolbar.swift
//  FeedsStore
//
//  Created by Sebastian Fernandez on 2025-06-14.
//

import SwiftUI

struct SocialToolbar: View {
    @ObservedObject var feed: ObservableFeed

    var body: some View {
        HStack(spacing: 24){
            HStack {
                Button {
                    feed.like()
                } label: {
                    Image(systemName: feed.isLiked ? "heart.fill" : "heart")
                        .tint(.red)
                }
                Text("\(feed.likes)")
            }

            HStack {
                Image(systemName: "message")
                    .tint(.black)
                Text("\(feed.comments)")
            }
        }
        .font(.caption)
    }
}

#Preview {
    SocialToolbar(feed: ObservableFeed(title: "Hey", isLiked: false, likes: 43, comments: 56))
}
