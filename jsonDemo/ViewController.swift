//
//  ViewController.swift
//  jsonDemo
//
//  Created by Scott Yoshimura on 5/23/15.
//  Copyright (c) 2015 west coast dev. All rights reserved.
//
// lets download a url and print it to the console
// telize.com/geoip

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlPath = "http://www.telize.com/geoip"
        //let's define the URL that will be used. the contents will be downloaded.
        // the variable has a type of NSURL from a string, in swift, a URL is different from a string, so we have to convert a URL to a string.
        let url0 = NSURL(string: urlPath)
        
        var errorMessage = NSError()
        //lets create a task. the task will go to stackoverflow and get the contents.
        //first, we define the task, and then specify the method that is associated with that task.
        //NSURLSession type with the sharedSession method opens an http session inside of the app.
        //.dataTaskWithURL gets the data from the URL
        let task0 = NSURLSession.sharedSession().dataTaskWithURL(url0!) { (data, response, error) in //"in" is used to indicate that there is a chunk of code coming up.
            
            if error == nil {
                //println(data)
            //the task is of type NSURLSession, we are using the sharedSessionMethod, and passing in url1
            //there are three variables that are returned by a task with type NSURLSession. data, response, error
                
                
            //if we simply println(data) it will pring the data to log, but not in any format we can understand, so we have to turn the data into UTF8. we will convvert into a string from data.
  //              var urlContent0 = NSString(data: data, encoding: NSUTF8StringEncoding)
  //              println(urlContent0)
                
                //lets do the actual json processing on the data variable
            let jsonResponse = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
                //the above function can take the serialized json string and put it into an array or dictionary for us to use. we use NSJsonReadingOptions.Mutlable containers, this allows us to work with the containers and do womething with them
                    //we know we want a dictionary, cause if we look at the data, it is in a dictinoary format
              
                //lets check for an error message before running the jsonResponse
                
                    println(jsonResponse)
                
                // now lets access one level into hte dictionary
                    println(jsonResponse["region_code"])
                
                
            } else {
                println("there was an error")
            }
            
            
        }
       
        
        task0.resume()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

