//
//  ScraperService.swift
//  Reddit Scraper Demo
//
//  Created by Zach Lockett-Streiff on 5/16/18.
//  Copyright © 2018 Swingaroo2. All rights reserved.
//

import Foundation

class ScraperService: NSObject {
    
    let defaultSession = URLSession(configuration: .default)
    var subreddit:Subreddit?
    var dataTask:URLSessionDataTask?
    
    func getSubreddit(_ subreddit:String,_ completion: @escaping (Subreddit?) -> ())
    {
        guard let subredditJSONURL = URL(string: "https://www.reddit.com/r/\(subreddit)/.json") else
        {
            print("Bad URL")
            return
        }
        
        self.dataTask?.cancel()
        
        //TODO: additional url stuff when needed
        self.performNetworkCallOnSubredditJSONURL(subredditJSONURL,completion)
        self.dataTask?.resume()
    }
    
    func performNetworkCallOnSubredditJSONURL(_ url:URL,_ completion: @escaping (Subreddit?) -> ())
    {
        self.dataTask = self.defaultSession.dataTask(with: url) { data, response, error in
            defer
            {
                self.dataTask = nil
            }
            
            if let error = error
            {
                print("Error: \(error.localizedDescription)")
            } else if let jsonData = data {
                self.subreddit = JSONParser().parseSubredditJSONData(jsonData: jsonData)
                DispatchQueue.main.async {
                    completion(self.subreddit)
                }
            }
        }
    }
    
}
