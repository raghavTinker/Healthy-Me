//
//  LogsInDateTableVC.swift
//  Healthy Me
//
//  Created by Raghav Sharma on 02/07/18.
//  Copyright © 2018 Raghav Sharma. All rights reserved.
//

import UIKit

class LogsInDateTableVC: UITableViewController {
    
    
    var date: FoodLogs?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Logs in \(date!.date)"
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
   

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return date!.logTimeArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        let logTime = date!.logTimeArray[indexPath.row]
        let serialNumber = date!.serialNumber[indexPath.row]
        cell.textLabel?.text = "Log:\(serialNumber) @ \(logTime)"
        // Configure the cell...
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let foodInfo = FoodInfoVC()
        foodInfo.index = indexPath.row
        foodInfo.date = date!
        navigationController?.pushViewController(foodInfo, animated: true)
    }

}
