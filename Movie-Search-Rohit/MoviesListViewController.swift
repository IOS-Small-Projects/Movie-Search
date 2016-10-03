//
//  MoviesListViewController.swift
//  Movie-Search-Rohit
//
//  Created by Arpit Gandhi on 17/09/16.
//  Copyright © 2016 Ignite Solutions. All rights reserved.
//

import UIKit

class MoviesListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var moviesData:[Movie] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // number of rows in table view
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.moviesData.count
    }
    
    // create a cell for each table view row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:MovieListTableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! MovieListTableViewCell!
        
        // set the text from the data model
//       cell.poster.image = moviesData[indexPath.row].Poster
        cell.poster.image =
            NSURL(string: moviesData[indexPath.row].Poster!)
                .flatMap { NSData(contentsOfURL: $0) }
                .flatMap { UIImage(data: $0) }
        
        cell.title.text = moviesData[indexPath.row].Title
        cell.type.text = moviesData[indexPath.row].Type
        cell.year.text = moviesData[indexPath.row].Year
        
        
        return cell
    }
    
    @IBAction func dismissVC(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {});
    }
    
}
