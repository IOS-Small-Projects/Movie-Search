//
//  ApiHelper.swift
//  Movie-Search-Rohit
//
//  Created by Arpit Gandhi on 17/09/16.
//  Copyright © 2016 Ignite Solutions. All rights reserved.
//

import Foundation

class ApiHelper{

    static func getMovies(name: String, completionHandler: (moviesData: [Movie]) -> ()) {
        // array of movies
        var moviesData:[Movie] = []
        
        
        // Setup the session to make REST GET call.  Notice the URL is https NOT http!!
        let postEndpoint: String = ApiConstant.GET_OMDB_API + name
        
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: postEndpoint)!
        
        // Make the POST call and handle it in a completion handler
        session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            // Make sure we get an OK response
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
            // Read the JSON
            do {
                if NSString(data:data!, encoding: NSUTF8StringEncoding) != nil {

                    
                    // Parse the JSON to get the IP
                    let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary

                    
                    if let movies = jsonDictionary["Search"] as? [NSDictionary] {
                        for movie in movies {
                            let poster = movie["Poster"] as! String
                            let title = movie["Title"] as! String
                            let type = movie["Type"] as! String
                            let year = movie["Year"] as! String
                            let imdbID = movie["imdbID"] as! String
                            
                            
                            // Craete movie object and add in array of movies
                            let _movie: Movie = Movie();
                            _movie.Poster = poster
                            _movie.Title = title
                            _movie.Type = type
                            _movie.Year = year
                            _movie.imdbID = imdbID
                            
                            moviesData.append(_movie)
                        }
                    }
                }
                
                // Return result
                completionHandler(moviesData: moviesData)
                
            } catch {
                print("Error")
            }
        }).resume()
    }
}
