//
// README.swift
//
//
// Follow Jay on mastodon @heyjay@iosdev.space
//              twitter   @heyjaywilson
//              github    @heyjaywilson
//              website  cctplus.dev
//
import Foundation
import ArgumentParser

@main
public struct README: ParsableCommand {
    @Argument(help: "The template file to parse and replace content")
    var template: String

    @Argument(help: "The path of the destination README file")
    var destination: String

    public init() { }

    mutating public func run() throws {

        // Blog posts
        let posts = try FeedReader().load()
        let formattedPosts = MarkdownFormatter.formatPostsToString(posts)
        let newContent = try String(contentsOf: URL(fileURLWithPath: template), encoding: .utf8).replacingOccurrences(of: "{latest_blogs}", with: formattedPosts)
        try newContent.write(to: URL(fileURLWithPath: destination), atomically: true, encoding: .utf8)

        // YouTube Videos
        let videos = try YouTubeReader().load()
        let formattedVideos = MarkdownFormatter.formatPostsToString(videos)
        let youtubeContent = try String(contentsOf: URL(fileURLWithPath: destination), encoding: .utf8).replacingOccurrences(of: "{latest_youtube}", with: formattedVideos)
        try youtubeContent.write(to: URL(fileURLWithPath: destination), atomically: true, encoding: .utf8)
    }
}
