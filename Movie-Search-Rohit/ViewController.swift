//
//  ViewController.swift
//  Movie-Search-Rohit
//
//  Created by Arpit Gandhi on 17/09/16.
//  Copyright © 2016 Ignite Solutions. All rights reserved.
//

import UIKit
import Dispatch

class ViewController: UIViewController {
       
    @IBOutlet weak var searchTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func submitBtnTouched(sender: UIButton) {
        let movieSearchTitle = searchTextField.text
        
        // Call omdbapi Api
        //ApiHelper.getMovies(movieSearchTitle!)
        ApiHelper.getMovies(movieSearchTitle!) { moviesData in
            
            // TODO: Remove
            for movie in moviesData
            {
                print(movie.Title! + movie.Type! + movie.Year!)
                print()
            }
            
            // display second page
            dispatch_async(dispatch_get_main_queue()) {
                let vc:MoviesListViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MoviesListCtrl") as! MoviesListViewController
                vc.moviesData = moviesData
                self.presentViewController(vc, animated: false, completion: nil)
            }
        }
    }
}

