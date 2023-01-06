//
//  File.swift
//  
//
//  Created by Jay on 1/5/23.
//

import Foundation

struct YouTubeReader {
    let parser: FeedParser

    init() {
        self.parser = FeedParser(
            URL: URL(
                string: "https://www.youtube.com/feeds/videos.xml?channel_id=UC6na4Lq0ozPBjHD1X42szEQ"
            )!
        )
    }

    func load throws -> [Post] {
        print(parser.parse().get().atomFeed?.title)
    }
}
