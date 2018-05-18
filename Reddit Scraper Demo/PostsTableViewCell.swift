//
//  PostsTableViewCell.swift
//  Reddit Scraper Demo
//
//  Created by Zach Lockett-Streiff on 5/17/18.
//  Copyright © 2018 Swingaroo2. All rights reserved.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    @IBOutlet weak var postID: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var subName: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(with post:Post)
    {
        self.title.text = post.title
        self.author.text = post.author
        self.postID.text = post.id
        self.subName.text = post.subredditName
    }
    
}
