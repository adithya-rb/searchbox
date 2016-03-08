//
//  searchTableViewController.swift
//  searchbox
//
//  Created by Adithya_rb on 10/4/15.
//  Copyright © 2015 Adithya Bharadwaj. All rights reserved.
//

import UIKit

class searchTableViewController: UITableViewController,UISearchResultsUpdating {
    
    
    let appleproducts = ["Macbook","Iphone","Ipad","Ipod","Apple Watch","Apple TV"]
    var filteredAppleProducts = [String]()
    var resultSearchController = UISearchController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.resultSearchController = UISearchController(searchResultsController: nil)
        self.resultSearchController.searchResultsUpdater = self
        self.resultSearchController.dimsBackgroundDuringPresentation = false
        self.resultSearchController.searchBar.sizeToFit()
        self.tableView.tableHeaderView = self.resultSearchController.searchBar
        self.tableView.reloadData()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.resultSearchController.active{
            return self.filteredAppleProducts.count
        }
        else{
            return self.appleproducts.count
        }
        
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell?
        if self.resultSearchController.active{
            cell?.textLabel?.text = self.filteredAppleProducts[indexPath.row]
            
        }
        else
        {
            cell?.textLabel?.text = self.appleproducts[indexPath.row]
        }
        return cell!
}

    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        self.filteredAppleProducts.removeAll(keepCapacity: false)
        //let searchpredicate = NSPredicate(format: "SELF CONTAINS[c] %@", arguments: searchController.searchBar.text)
        let searchpredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (self.appleproducts as NSArray).filteredArrayUsingPredicate(searchpredicate)
        self.filteredAppleProducts = array as! [String]
        self.tableView.reloadData()
        
        
    }
}


