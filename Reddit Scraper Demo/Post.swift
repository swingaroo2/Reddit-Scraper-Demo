//
//  Post.swift
//  Reddit Scraper Demo
//
//  Created by Zach Lockett-Streiff on 5/17/18.
//  Copyright © 2018 Swingaroo2. All rights reserved.
//

import Foundation

class Post: NSObject
{
    var postDict:[String:Any]?

    var id:String = ""
    var subredditName:String = ""
    var title:String = ""
    var author:String = ""
    
    static func createPostFromJSON(postJSON:[String:Any]?) -> Post? {
        let post:Post = Post()
        
        if let json = postJSON
        {
            if let data = json["data"] as? [String:Any]
            {
                post.id = data["id"] as! String
                post.subredditName = data["subreddit"] as! String
                post.title = data["title"] as! String
                post.author = data["author"] as! String
            }
        }
        return post
    }
}
