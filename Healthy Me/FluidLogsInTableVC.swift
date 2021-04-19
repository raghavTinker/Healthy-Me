//
//  FluidLogsInTableVC.swift
//  Healthy Me
//
//  Created by Raghav Sharma on 10/07/18.
//  Copyright © 2018 Raghav Sharma. All rights reserved.
//

import UIKit

class FluidLogsInTableVC: UITableViewController {

    var date: FluidLogs?
    
    private let headerHeight: CGFloat = 100.0
    private let amountLabelIntroHeight: CGFloat = 45.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Logs of \(date!.date)"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Header Stuff(Diplaying how much fluid drank in the day)
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return createHeaderView()
    }
    
    func createHeaderView()->UIView{
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: headerHeight))
        headerView.backgroundColor = UIColor.white
        let amountOfWaterIntro = UILabel(frame: CGRect(x: 0, y:0 ,width: view.frame.size.width, height: amountLabelIntroHeight))
        amountOfWaterIntro.text = "Amount of fluid intake on \(date!.date)"
        amountOfWaterIntro.textAlignment = .center
        headerView.addSubview(amountOfWaterIntro)
        
        //Amount of fluid
        
        var amountOfFluidDouble: Double = 0.0
        for i in date!.waterAmountLog{
            amountOfFluidDouble = amountOfFluidDouble + i
        }
        
        let amountOfFluid = UILabel(frame: CGRect(x:0, y:amountLabelIntroHeight, width: view.frame.width, height:headerHeight - amountLabelIntroHeight))
        amountOfFluid.font = UIFont.boldSystemFont(ofSize: 45.0)
        amountOfFluid.text = " \(amountOfFluidDouble / 1000) litres"
        amountOfFluid.textAlignment = .center
        
        headerView.addSubview(amountOfFluid)
        return headerView
    }
    //---------------------------
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return date!.timeLog.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        let logTime = date!.timeLog[indexPath.row]
        let serialNumber = date!.serialNumber[indexPath.row]
        var amountOfFluid: Double = date!.waterAmountLog[indexPath.row]
	
	if amountOfFluid >= 1000{
		amountOfFluid = amountOfFluid / 1000
        if amountOfFluid == 1.0{
            cell.textLabel?.text = "Log:\(serialNumber) @ \(logTime) -> \(amountOfFluid) litre"
        }
        else{
            cell.textLabel?.text = "Log:\(serialNumber) @ \(logTime) -> \(amountOfFluid) litres"
        }
	}
	else{
		cell.textLabel?.text = "Log:\(serialNumber) @ \(logTime) -> \(amountOfFluid)ml"

    }
        
        // Configure the cell...
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fluidInfo = FluidInfoVCViewController()
        fluidInfo.date = date!
        fluidInfo.index = indexPath.row
        navigationController?.pushViewController(fluidInfo, animated: true)
    }

}
