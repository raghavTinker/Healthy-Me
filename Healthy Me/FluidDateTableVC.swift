//
//  FluidDateTableVC.swift
//  Healthy Me
//
//  Created by Raghav Sharma on 10/07/18.
//  Copyright © 2018 Raghav Sharma. All rights reserved.
//

import UIKit

class FluidDateTableVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Fluid Log Dates"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        selfCheck()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return HealthData.fluidLogs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        let logDate = HealthData.fluidLogs[indexPath.row]
        print(logDate.day)
        if logDate.isItToday{
            cell.textLabel?.text = "Today Logs"
        }
        else{
            cell.textLabel?.text = "\(logDate.date) -> \(logDate.day) Logs"
        }
        
        // Configure the cell...
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let logsTable = FluidLogsInTableVC()
        logsTable.date = HealthData.fluidLogs[indexPath.row]
        navigationController?.pushViewController(logsTable, animated: true)
    }
    
    func selfCheck(){
        
    }

}
