//
//  ViewController.swift
//  Reddit Scraper Demo
//
//  Created by Zach Lockett-Streiff on 5/16/18.
//  Copyright © 2018 Swingaroo2. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate
{
    let postCellIdentifier = "PostCellIdentifier"
    
    @IBOutlet weak var textEntryField: UITextField!
    @IBOutlet weak var postsTableView: UITableView!
    
    var subreddit:Subreddit?
    
    // MARK: - Lifecycle Callbacks
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setUpTableView()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        let service = ScraperService()
        let displaySubreddit: (Subreddit?) -> () = { sub in
            self.subreddit = sub;
            self.postsTableView.reloadData()
        }
        service.getSubreddit("shield", displaySubreddit)
    }
    
    // MARK: - UITableView
    func setUpTableView()
    {
        let nibName = "PostsTableViewCell"
        self.postsTableView.register(UINib.init(nibName: nibName, bundle: nil), forCellReuseIdentifier: postCellIdentifier)
        self.postsTableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let numRows = self.subreddit?.posts.count
        {
            return numRows;
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: postCellIdentifier, for: indexPath) as! PostsTableViewCell
        if let post = self.subreddit?.posts[indexPath.row]
        {
            cell.configureCell(with: post)
        }
        return cell
    }
}
