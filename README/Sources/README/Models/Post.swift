//
//  Post.swift
//
//
//
// Follow Jay on mastodon @heyjay@iosdev.space
//              twitter   @heyjaywilson
//              github    @heyjaywilson
//              website  cctplus.dev
//

import Foundation

struct Post {
    let title: String
    let link: String
}

extension Post {
    var markdown: String {
        "- [\(title)](\(link))"
    }
}
