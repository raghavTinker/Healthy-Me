//
//  WelcomeVC.swift
//  Healthy Me
//
//  Created by Raghav Sharma on 30/06/18.
//  Copyright © 2018 Raghav Sharma. All rights reserved.
//

import UIKit
import Foundation

class WelcomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
        addWeightEntryButton()
        addFoodEntryButton()
        addFluidLoggingButton()
        addFoodInTakeTableButton()
        addFluidInTakeTableButton()
        addWeightGraphButton()
        addResetButton()
        
        //Debug
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    //UIElements
    func addWeightEntryButton(){
        let weightVCShiftButton = UIButton(frame: CGRect(x: 35, y: 100 - 20, width: 300, height: 60))
        weightVCShiftButton.backgroundColor = UIColor.magenta
        weightVCShiftButton.titleLabel?.textColor = UIColor.white
        weightVCShiftButton.titleLabel?.font = UIFont(name: "Avenir-Light", size: 20)
        weightVCShiftButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        weightVCShiftButton.layer.cornerRadius = 20
        
        weightVCShiftButton.setTitle("Weight Entry", for: .normal)
        weightVCShiftButton.addTarget(self, action: #selector(goToWeightEntry), for: .touchUpInside)
        view.addSubview(weightVCShiftButton)
    }
    func addWeightGraphButton(){
        let weightGraphButton = UIButton(frame: CGRect(x: 35, y: 200 - 20, width: 300, height: 60))
        weightGraphButton.backgroundColor = UIColor.brown
        weightGraphButton.titleLabel?.textColor = UIColor.white
        weightGraphButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        weightGraphButton.layer.cornerRadius = 20
        
        weightGraphButton.setTitle("Weight Graph", for: .normal)
        weightGraphButton.addTarget(self, action: #selector(goToWeightGraph), for: .touchUpInside)
        view.addSubview(weightGraphButton)
    }
    func addFoodEntryButton(){
        let foodEntryButton = UIButton(frame: CGRect(x: 35, y: 300 - 20, width: 300, height: 60))
        foodEntryButton.backgroundColor = UIColor.purple
        foodEntryButton.titleLabel?.textColor = UIColor.white
        foodEntryButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        foodEntryButton.layer.cornerRadius = 20
        
        foodEntryButton.setTitle("Food Entry", for: .normal)
        foodEntryButton.addTarget(self, action: #selector(goToFoodEntry), for: .touchUpInside)
        view.addSubview(foodEntryButton)
    }
    
    func addFluidLoggingButton(){
        let waterLogger = UIButton(frame: CGRect(x: 35, y: 400 - 20, width: 300, height: 60))
        waterLogger.backgroundColor = UIColor.blue
        waterLogger.titleLabel?.textColor = UIColor.white
        waterLogger.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        waterLogger.layer.cornerRadius = 20
        
        
        waterLogger.setTitle("Fluid Entry", for: .normal)
        waterLogger.addTarget(self, action: #selector(addFluidLog), for: .touchUpInside)
        view.addSubview(waterLogger)
    }
    
    func addFoodInTakeTableButton(){
        let foodReview = UIButton(frame: CGRect(x: 35, y: 500 - 20, width: 300, height: 60))
        foodReview.backgroundColor = UIColor.red
        foodReview.titleLabel?.textColor = UIColor.white
        foodReview.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        foodReview.layer.cornerRadius = 20

        
        foodReview.setTitle("Food Logs", for: .normal)
        foodReview.addTarget(self, action: #selector(goToFoodLogs), for: .touchUpInside)
        view.addSubview(foodReview)
    }
    
    func addFluidInTakeTableButton(){
        let fluidLog = UIButton(frame: CGRect(x: 35, y: 600 - 20, width: 300, height: 60))
        fluidLog.backgroundColor = UIColor(red:0.00, green:0.50, blue:1.00, alpha:1.0)
        fluidLog.titleLabel?.textColor = UIColor.white
        fluidLog.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        fluidLog.layer.cornerRadius = 20
        
        
        fluidLog.setTitle("Fluid Logs", for: .normal)
        fluidLog.addTarget(self, action: #selector(goToFluidLogs), for: .touchUpInside)
        view.addSubview(fluidLog)
    }
    
    @objc func goToFluidLogs(){
        let fluidDateTable = FluidDateTableVC()
        navigationController?.pushViewController(fluidDateTable, animated: true)
    }
    
    
    
    
    func addResetButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reset Data", style: .plain, target: self, action:#selector(warn))
    }
    
    //Go to:
    
    @objc func addFluidLog(){
        let fluidEntryVC = FluidEntryVC()
        navigationController?.pushViewController(fluidEntryVC, animated: true)
    }
    
    @objc func warn(){
        let actionSheet = UIAlertController(title: "Reset Health Data", message: "Resetting your health data will completely erase your weight data and food logs", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Reset Health Data", style: .destructive, handler:{(action: UIAlertAction) in self.resetHealthData()}))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func resetHealthData(){
        HealthData.foodLogs = []
        HealthData.fluidLogs = []
        HealthData.datesCurrentMonthArray = []
        HealthData.weightArrayMonthAvg = [0,0,0,0,0,0,0,0,0,0,0,0]
        HealthData.weightArrayCurrentMonth = []
        HealthData.currentMonth = BasicFunctionality().getCurrentMonth()
        BasicFunctionality().saveData()
    }
    //Going to WeightEntryVC
    @objc func goToWeightEntry(){
        var isError: Bool = false
        let todayDate: Int = BasicFunctionality().getCurrentDate()
        for i in HealthData.datesCurrentMonthArray{
            if i==todayDate{
                isError = true
                break
            }
            else{
                isError = false
            }
        }
        if isError{
            let error = UIAlertController(title: "You cannot input another weight entry in one day. One weight entry per day allowed.", message: nil, preferredStyle: .alert)
            error.addAction(UIAlertAction(title:"OK", style: .default, handler:{(action) in error.dismiss(animated: true, completion: nil)}))
            
            self.present(error, animated: true, completion: nil)
        }
        else{
            let weightInput = UIAlertController(title: "What's your weight?(in kg(s))", message: nil, preferredStyle:.alert)
            weightInput.addTextField{(textField)in
                textField.placeholder = "65.3"
                textField.keyboardType = .decimalPad
                
                weightInput.addAction(UIAlertAction(title: "OK", style: .default, handler:{(action) in
                    if let text = weightInput.textFields?[0].text{
                        if let weight = Double(text){
                            BasicFunctionality().addWeightEntry(weight: weight)
                        }
                    }
                }))
                self.present(weightInput, animated: true, completion: nil)
            }
        }
    }
    
    @objc func goToWeightGraph(){
        let weightGraphVC = WeightGraphVC()
        navigationController?.pushViewController(weightGraphVC, animated: true)
    }
    
    @objc func goToFoodEntry(){
        let foodEntryVC = FoodEntryVC()
        navigationController?.pushViewController(foodEntryVC, animated: true)
    }
    
    @objc func goToFoodLogs(){
        if HealthData.foodLogs.count == 0{
            let error = UIAlertController(title: "First make a food entry! ERROR = No data", message: nil, preferredStyle: .alert)
            error.addAction(UIAlertAction(title:"OK", style: .default, handler:{(action) in error.dismiss(animated: true, completion: nil)}))
            
            self.present(error, animated: true, completion: nil)
        }
        else{
            let foodLogDateTableVC = FoodLogDateTableVC()
            navigationController?.pushViewController(foodLogDateTableVC, animated: true)
        }
    }
}
