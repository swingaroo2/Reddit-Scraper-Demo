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
    var json: [String:Any]?
    
    func parseSubredditJSONData(jsonData:Data) -> Subreddit?
    {
        let rawJSON = try? JSONSerialization.jsonObject(with: jsonData, options: [])
        
        guard let json = rawJSON as? [String: Any] else
        {
            print("Bad JSON")
            return nil
        }
        self.json = json
        
        let subreddit = Subreddit.createSubredditObjectWith(subredditDict: self.json)
        
        return subreddit
    }
}
