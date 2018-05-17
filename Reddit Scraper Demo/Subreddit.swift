//
//  Subreddit.swift
//  Reddit Scraper Demo
//
//  Created by Zach Lockett-Streiff on 5/16/18.
//  Copyright © 2018 Swingaroo2. All rights reserved.
//

import Foundation

class Subreddit: NSObject {
    var kind:String?
    var posts:[Post]?
    
    static func createSubredditObjectWith(subredditDict:[String:Any]?) -> Subreddit?
    {
        guard let subredditDict = subredditDict else
        {
            print("Bad dictionary")
            return nil
        }
        let subreddit:Subreddit = Subreddit()
        subreddit.kind = subredditDict["kind"] as? String
        
        // more initialization
        subreddit.posts = subreddit.createPostsArrayFrom(subredditDict)
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
            posts?.append(newPost)
        }
        return nil
    }
}
