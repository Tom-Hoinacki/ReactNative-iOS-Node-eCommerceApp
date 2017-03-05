//
//  ViewController.swift
//  HelloWorldTom
//
//  Created by Thomas Hoinacki on 2/25/17.
//  Copyright © 2017 Thomas Hoinacki. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var MovieTitle1: UILabel!
    @IBOutlet weak var MovieYear1: UILabel!
    @IBOutlet weak var MovieTitle2: UILabel!
    @IBOutlet weak var MovieYear2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlString = "https://facebook.github.io/react-native/movies.json"
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                print(error)
            } else {
               do {
            
                if let parsedData = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String: Any] {
                    
                    if let title = parsedData["title"] as? String {
                        self.Name.text = title;
                    }
                    
                    var movieTitles = [String]()
                    var movieYears = [String]()
                    
                     if let movies = parsedData["movies"] as? [[String: Any]] {
                        for movie in movies {
                            if let movieTitle = movie["title"] as? String {
                                movieTitles.append(movieTitle);
                            }
                            
                            if let movieYear = movie["releaseYear"] as? String {
                                movieYears.append(movieYear);
                            }
                        }
                        
                        self.MovieTitle1.text = movieTitles[0];
                        self.MovieYear1.text = movieYears[0];
                        self.MovieTitle2.text = movieTitles[1];
                        self.MovieYear2.text = movieYears[1];

                        }
                    }

                    } catch let error as NSError {
                        print(error)
                    }
                }
            }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

