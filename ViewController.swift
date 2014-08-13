//
//  ViewController.swift
//  iReels
//
//  Created by Michael Stromer on 8/12/14.
//  Copyright (c) 2014 Michael Stromer. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let viewModel = ViewModel()
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchItems {
            dispatch_async(dispatch_get_main_queue()) {
             self.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return viewModel.numberOfSections()
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section)
    }
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        configureCell(cell, atIndexPath: indexPath)
        return cell
    }
    func configureCell(cell: UITableViewCell, atIndexPath indexPath:NSIndexPath) {
        cell.textLabel.text = viewModel.titleForItemAtIndexPath(indexPath)
    }
}

