//
//  File.swift
//  
//
//  Created by Jay on 1/5/23.
//

import Foundation
struct MarkdownFormatter {
    static func formatPostsToString(_ posts: [Post]) -> String {
        posts.map { $0.markdown }.joined(separator: "\n")
    }
}
