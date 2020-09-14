//
//  TabelViewController.swift
//  demoAs3_1
//
//  Created by Shubham Soni on 12/6/20.
//  Copyright © 2020 Shubham Soni. All rights reserved.
//

import UIKit

class TabelViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    @IBOutlet weak var tabelView: UITableView!
   let CellIdentifier = "prototypecell"
    
//    let data = ["New York, NY", "Los Angeles, CA", "Chicago, IL", "Houston, TX","Philadelphia, PA", "Phoenix, AZ", "San Diego, CA", "San Antonio, TX",
//        "Dallas, TX", "Detroit, MI", "San Jose, CA", "Indianapolis, IN",
//        "Jacksonville, FL", "San Francisco, CA", "Columbus, OH", "Austin, TX",
//        "Memphis, TN", "Baltimore, MD", "Charlotte, ND", "Fort Worth, TX"]
    let data = LocalViewController.objectName

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelView.delegate = self
        tabelView.dataSource = self
        tabelView.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier)
    
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // If there are no cells available for reuse, it will always return a cell so long as the identifier has previously been registered
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath)
        var (testName) = data[indexPath.row]
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath as IndexPath) as UITableViewCell

        cell.textLabel?.text=data[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webvc = storyboard?.instantiateViewController(withIdentifier: "WebsearchViewController") as? WebsearchViewController
        webvc?.word = data[indexPath.row]
        self.navigationController?.pushViewController(webvc!, animated: true)
    }
    
    
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

