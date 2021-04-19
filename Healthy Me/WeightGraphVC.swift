//
//  WeightGraphVC.swift
//  Healthy Me
//
//  Created by Raghav Sharma on 30/06/18.
//  Copyright © 2018 Raghav Sharma. All rights reserved.
//

import UIKit
import SwiftChart

class WeightGraphVC: UIViewController {
    var weightGraph = Chart()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red:0.81, green:1.00, blue:0.80, alpha:1.0)
        addMonthButton()
        addYearButton()
        
        title = "Weight Analytics"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addMonthButton(){
        let monthGraphButton = UIButton(frame: CGRect(x: 37, y: 200, width: 300, height: 60))
        monthGraphButton.backgroundColor = UIColor.purple
        monthGraphButton.titleLabel?.textColor = UIColor.white
        monthGraphButton.titleLabel?.font = UIFont(name: "Avenir-Light", size: 20)
        monthGraphButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        monthGraphButton.layer.cornerRadius = 20
        
        monthGraphButton.setTitle("Monthly Graph", for: .normal)
        monthGraphButton.addTarget(self, action: #selector(goToMonthGraph), for: .touchUpInside)
        view.addSubview(monthGraphButton)
    }
    func addYearButton(){
        let yearGraphButton = UIButton(frame: CGRect(x: 37, y: 200 + 100, width: 300, height: 60))
        yearGraphButton.backgroundColor = UIColor.red
        yearGraphButton.titleLabel?.textColor = UIColor.white
        yearGraphButton.titleLabel?.font = UIFont(name: "Avenir-Light", size: 20)
        yearGraphButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        yearGraphButton.layer.cornerRadius = 20
        
        yearGraphButton.setTitle("Year Graph", for: .normal)
        yearGraphButton.addTarget(self, action: #selector(goToYearGraph), for: .touchUpInside)
        view.addSubview(yearGraphButton)
    }
    
    @objc func goToMonthGraph(){
        print("HELLO")
        if HealthData.weightArrayCurrentMonth.count < 5{
            let error = UIAlertController(title: "Less observations to form a graph. Let more observations be recorded. Minimum days required for graph = 5", message: nil, preferredStyle: .alert)
            error.addAction(UIAlertAction(title:"OK", style: .default, handler:{(action) in error.dismiss(animated: true, completion: nil)}))
            
            self.present(error, animated: true, completion: nil)
        }
        else{
            let monthGraphVC = MonthGraphVC()
            navigationController?.pushViewController(monthGraphVC, animated: true)
        }
        
    }
    @objc func goToYearGraph(){
        var count = 0
        for i in HealthData.weightArrayMonthAvg{
            if i == 0.0{
                count = count + 1
            }
        }
        if count > 3{
            let error = UIAlertController(title: "Less observations to form a graph. Let more observations be recorded. Minimum months required for graph = 3", message: nil, preferredStyle: .alert)
            error.addAction(UIAlertAction(title:"OK", style: .default, handler:{(action) in error.dismiss(animated: true, completion: nil)}))
            
            self.present(error, animated: true, completion: nil)
        }
        else{
            let yearGraphVC = WeightYearVC()
            navigationController?.pushViewController(yearGraphVC, animated: true)
        }
    }
}
