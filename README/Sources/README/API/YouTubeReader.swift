//
//  YouTubeReader.swift
//
//
//
// Follow Jay on mastodon @heyjay@iosdev.space
//              twitter   @heyjaywilson
//              github    @heyjaywilson
//              website   cctplus.dev
//

import Foundation
import FeedKit

struct YouTubeReader {
    let parser: FeedParser

    init() {
        self.parser = FeedParser(
            URL: URL(
                string: "https://www.youtube.com/feeds/videos.xml?channel_id=UC6na4Lq0ozPBjHD1X42szEQ"
            )!
        )
    }

    func load() throws -> [Post] {
        let posts: [Post] = try parser
            .parse()
            .get()
            .atomFeed?
            .entries?
            .compactMap { $0 }
            .prefix(3)
            .map {
                var link: String? = nil
                for videoLink in $0.links ?? [] {
                    link = videoLink.attributes?.href
                }
                return Post(title: ($0.title ?? "") as String, link: link ?? "")
            } ?? []

//        print(posts)

        return posts
    }
}
