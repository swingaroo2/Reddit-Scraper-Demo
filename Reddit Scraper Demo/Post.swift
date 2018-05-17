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
    
    init(postDict:[String:Any]?) {
        self.postDict = postDict
        super.init()
    }
}
