//
//  Subreddit.swift
//  Reddit Scraper Demo
//
//  Created by Zach Lockett-Streiff on 5/16/18.
//  Copyright © 2018 Swingaroo2. All rights reserved.
//

import Foundation

class Subreddit: NSObject {
    var kind:String = ""
    var posts:[Post] = []
    
    static func createSubredditObjectWith(_ subredditDict:[String:Any]) -> Subreddit?
    {
        let subreddit:Subreddit = Subreddit()
        guard let kind = subredditDict["kind"] as? String else
        {
            print("kind not found")
            return nil
        }
        subreddit.kind = kind
        
        guard let posts = subreddit.createPostsArrayFrom(subredditDict) else
        {
            print("posts not found")
            return nil
        }
        subreddit.posts = posts
        return subreddit
    }
    
    private func createPostsArrayFrom(_ subredditDict:[String:Any]?) -> [Post]?
    {
        guard let sub = subredditDict else {return nil}
        guard let data = sub["data"] as? [String:Any] else {return nil}
        guard let children = data["children"] as? Array<[String:Any]> else {return nil}
        
        self.posts = []
        for post in children {
            guard let newPost = Post.createPostFromJSON(postJSON: post) else
            {
                return nil
            }
            posts.append(newPost)
        }
        return posts
    }
}
