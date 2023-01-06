//
//  FeedReader.swift
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

struct FeedReader {
    let parser: FeedParser

    init(parser: FeedParser = .init(URL: URL(string: "https://cctplus.dev/rss")!)) {
        self.parser = parser
    }

    func load() throws ->  [Post] {
            try parser
                .parse()
                .get()
                .rssFeed?
                .items?
                .compactMap { $0 }
                .prefix(3)
                .map { Post(title: $0.title ?? "", link: $0.link ?? "") } ?? []
    }
}
