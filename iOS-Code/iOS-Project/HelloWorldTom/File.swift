//
//  File.swift
//  HelloWorldTom
//
//  Created by Thomas Hoinacki on 3/2/17.
//  Copyright © 2017 Thomas Hoinacki. All rights reserved.
//

import Foundation

import UIKit

class ItemViewController: UIViewController {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var authorField: UITextField!
    
    var session: NSURLSession!
    var items = NSObject()
    
    var lookUpID = "0586057242" // This will eventually get passed in from elsewhere.
    
    
    required init (coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        session = NSURLSession(configuration: config, delegate: nil, delegateQueue: nil)
        
        fetchItem()
    }
    
    func fetchItem() {
        let requestString = ("https://openlibrary.org/api/books?bibkeys=" + lookUpID + "&f&jscmd=data&format=json")
        if let url = NSURL(string: requestString) {
            let req = NSURLRequest(URL: url)
            
            let dataTask = session.dataTaskWithRequest(req) {
                (data, response, error) in
                if data != nil {
                    var error: NSError?
                    if let jsonObject = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error) as? NSDictionary  {
                        
                        if let itemDictionary: AnyObject  = jsonObject["\(self.lookUpID)"]{
                            if let id = itemDictionary as? NSObject {
                                self.items = id
                                
                                println("\(self.items)")
                                
                                // Works.
                                self.titleField.text = itemDictionary["title"] as? String
                                
                                // Does not work.
                                self.authorField.text = itemDictionary["authors"]["name"] as? String
                                
                                
                            }
                            
                        }
                    } else {
                        if let error = error {
                            println("Error parsing JSON: \(error)")
                        }
                    }
                } else {
                    println("Error fetching Item: \(error.localizedDescription)")
                }
            }
            dataTask.resume()
        }
    }
    
}
