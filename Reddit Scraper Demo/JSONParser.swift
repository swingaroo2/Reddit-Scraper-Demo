//
//  JSONParser.swift
//  Reddit Scraper Demo
//
//  Created by Zach Lockett-Streiff on 5/16/18.
//  Copyright © 2018 Swingaroo2. All rights reserved.
//

import Foundation

class JSONParser : NSObject
{
    var json: [String:Any] = [String:Any]()
    
    func parseSubredditJSONData(jsonData:Data) -> Subreddit?
    {
        var subreddit = Subreddit()
        let rawJSON = try? JSONSerialization.jsonObject(with: jsonData, options: [])
        
        guard let json = rawJSON as? [String: Any] else
        {
            print("bad JSON")
            return nil
        }
        self.json = json
        
        guard let sub = Subreddit.createSubredditObjectWith(self.json) else
        {
            print("Subreddit object is nil")
            return nil
        }
        subreddit = sub
        
        return subreddit
    }
}
