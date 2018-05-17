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
//    var posts:[Post]
    
    static func createSubredditObjectWith(subredditDict:[String:Any]?) -> Subreddit? {
        guard let subredditDict = subredditDict else
        {
            print("Bad dictionary")
            return nil
        }
        let subreddit:Subreddit? = Subreddit()
        subreddit?.kind = subredditDict["kind"] as? String
        // more initialization
        return subreddit
    }
}
