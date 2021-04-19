//
//  WelcomeVCRevamped.swift
//  Healthy Me
//
//  Created by Raghav Sharma on 14/07/18.
//  Copyright © 2018 Raghav Sharma. All rights reserved.
//

import UIKit

class WelcomeVCRevamped: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Basic Stuff Don't waste time on it
        if HealthData.firstRun{
            
        }
        else{
            HealthData.currentMonth = BasicFunctionality().getCurrentMonth()
        }
        
        BasicFunctionality().checkCurrentMonth()
        
        view.backgroundColor = UIColor(red:0.47, green:0.80, blue:0.57, alpha:1.0)
        title = "Healthy Me"
        //retrieve data stored in cold storage
        BasicFunctionality().retrieveData()
        
        //Adding UIElements
        addLogButton()  

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addLogButton(){
        let button = UIButton(frame: CGRect(x: 35, y: 200, width: 300, height: 60))
        button.backgroundColor = UIColor.magenta
        button.titleLabel?.textColor = UIColor.white
        button.titleLabel?.font = UIFont(name: "Avenir-Light", size: 20)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        button.layer.cornerRadius = 20
        
        button.setTitle("Log Stuff", for: .normal)
        button.addTarget(self, action: #selector(goToLogVC), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func goToLogVC(){
        
    }
        
}
