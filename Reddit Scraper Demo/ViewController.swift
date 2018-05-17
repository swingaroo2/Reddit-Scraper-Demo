//
//  ViewController.swift
//  Reddit Scraper Demo
//
//  Created by Zach Lockett-Streiff on 5/16/18.
//  Copyright © 2018 Swingaroo2. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        let service = ScraperService()
        let displaySubreddit: (Subreddit?) -> () = { sub in
            dump(sub?.posts)
        }
        service.getSubreddit("shield", displaySubreddit)
    }
}

