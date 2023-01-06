//
//  MarkdownFormatter.swift
//  
//
// Follow Jay on mastodon @heyjay@iosdev.space
//              twitter   @heyjaywilson
//              github    @heyjaywilson
//              website  cctplus.dev
//

import Foundation
struct MarkdownFormatter {
    static func formatPostsToString(_ posts: [Post]) -> String {
        posts.map { $0.markdown }.joined(separator: "\n")
    }
}
