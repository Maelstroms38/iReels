//
//  ViewModel.swift
//  iReels
//
//  Created by Michael Stromer on 8/12/14.
//  Copyright (c) 2014 Michael Stromer. All rights reserved.
//

import Foundation

class ViewModel {
    
    let urlString = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
    var titles = [String]()
    
    func fetchItems(success: () -> ()) {
        let url = NSURL(string: urlString)
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        let task = session.dataTaskWithURL(url) { (data, response, error) in
            var jsonError: NSError?
            let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as NSDictionary
            
            if let unwrappedError = jsonError {
                println("json error: \(unwrappedError)")
            } else {
                self.titles = json.valueForKeyPath("feed.entry.im:name.label") as [String]
                success()
            }
        }
        task.resume()
    }
    func numberOfSections() -> Int {
        return 1
    }
    func numberOfItemsInSection(section: Int) -> Int {
        return titles.count
    }
    func titleForItemAtIndexPath(indexPath: NSIndexPath) -> String {
        return titles[indexPath.row]
    }
}