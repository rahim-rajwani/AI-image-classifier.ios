//
//  WebsearchViewController.swift
//  demoAs3_1
//
//  Created by user169689 on 6/12/20.
//  Copyright © 2020 Vaibhav patel. All rights reserved.
//

import UIKit
import WebKit

class WebsearchViewController: UIViewController {

    @IBOutlet var search: WKWebView!
    
    var word = ""
    var firstword = ""
   
        override func viewDidLoad() {
        super.viewDidLoad()
        print(word)
            
            let wordlist = self.word.components(separatedBy:",")
            for word in wordlist{
                firstword = word
                
                print(firstword)
                break
            }
            let final = firstword.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
            print(final!)
//        var word1 = "mouse"
            
        let url = URL(string: "https://en.wikipedia.org/wiki/\(final!)")!
        
            //Checking the url
            print(URLRequest(url: url))
            
            //Load the url in the WEbpage
        search.load(URLRequest(url: url))

            // Do any additional setup after loading the view.
        }
    
    

    }

