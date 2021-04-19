//
//  BasicFunctionality.swift
//  Healthy Me
//
//  Created by Raghav Sharma on 30/06/18.
//  Copyright © 2018 Raghav Sharma. All rights reserved.
//

import Foundation

class BasicFunctionality{
    var userDefaults = UserDefaults.standard
    
    func addWeightEntry(weight: Double){
        //Appending weight in weightArray
        HealthData.weightArrayCurrentMonth.append(weight)
        
        
        //Appending month in monthArray
        HealthData.datesCurrentMonthArray.append(getCurrentDate())//Date
        
        //Finding average of month till now
        //Sum of all the weight observations in the month through for loop
        var sumOfCurrentMonth: Double = 0
        for i in HealthData.weightArrayCurrentMonth{
            sumOfCurrentMonth = sumOfCurrentMonth + i
        }
        //Calculating average
        let averageOfCurrentMonth: Double = sumOfCurrentMonth / Double(HealthData.weightArrayCurrentMonth.count)
        
        //Appending the newly calculated average into the array
        HealthData.weightArrayMonthAvg[getCurrentMonth() - 1] = averageOfCurrentMonth
        
        //Debuggers
        print(HealthData.datesCurrentMonthArray)
        print("New weight array: \(HealthData.weightArrayCurrentMonth)")
        print("AverageArray: \(HealthData.weightArrayMonthAvg)")
        
        //Saving Data to cold storage
        saveData()
    }
    
    func addFoodLog(foodItem: String, carbs: Double, protein: Double, quantity: String){
        var count = 0
        for logs in HealthData.foodLogs{
            if logs.date == String(describing: giveMeEntireDate()){
                let newSerial = logs.serialNumber.last! + 1
                logs.serialNumber.append(newSerial)
                logs.foodItemArray.append(foodItem)
                logs.proteinLog.append(protein)
                logs.carbLog.append(carbs)
                logs.quantity.append(quantity)
                logs.logTimeArray.append(getCurrentTime())
                logs.isItToday = true
                break
            }
            else{
                //Pass
                count = count + 1
            }
        }
        if count == HealthData.foodLogs.count{
            
            let newLog = FoodLogs()
            if HealthData.foodLogs.count == 0{
                newLog.foodItemArray.append(foodItem)
                newLog.proteinLog.append(protein)
                newLog.carbLog.append(carbs)
                newLog.quantity.append(quantity)
                newLog.serialNumber.append(01)
                //Date Time hell
                newLog.date = giveMeEntireDate()
                print(getDay())
                newLog.day = getDay()
                newLog.logTimeArray.append(getCurrentTime())
                newLog.month = getCurrentMonth()
                newLog.year = getCurrentYear()
                //Resetting all days isItToday and setting true for today
                for i  in HealthData.foodLogs{
                    i.isItToday = false
                }
                newLog.isItToday = true
                
                HealthData.foodLogs.append(newLog)
            }
            else{
                newLog.foodItemArray.append(foodItem)
                newLog.proteinLog.append(protein)
                newLog.carbLog.append(carbs)
                newLog.quantity.append(quantity)
                newLog.serialNumber.append(01)
                //Date Time hell
                newLog.date = giveMeEntireDate()
                newLog.day = getDay()
                newLog.logTimeArray.append(getCurrentTime())
                newLog.month = getCurrentMonth()
                newLog.year = getCurrentYear()
                //Resetting all days isItToday and setting true for today
                for i  in HealthData.foodLogs{
                    i.isItToday = false
                }
                newLog.isItToday = true
                
                HealthData.foodLogs.insert(newLog, at: 0)
            }
            
        }
        saveData()
        
    }
    
    func checkCurrentMonth(){
        let currentDateTime = Date()
        let calendar = Calendar.current
        let month = calendar.component(.month, from: currentDateTime)
        if month != HealthData.currentMonth{
            HealthData.weightArrayCurrentMonth = []
            HealthData.datesCurrentMonthArray = []
            HealthData.currentMonth = month
            saveData()
        }
        else{
            
        }
    }
    
    func addFluidEntry(amount: Double, fluid: String){
        var count = 0
        for logs in HealthData.fluidLogs{
            if logs.date == String(describing: giveMeEntireDate()){
                let newSerial = logs.serialNumber.last! + 1
                logs.serialNumber.append(newSerial)
                logs.fluidType.append(fluid)
                logs.waterAmountLog.append(amount)
                logs.timeLog.append(getCurrentTime())
                logs.isItToday = true
                break
            }
            else{
                //Pass
                count = count + 1
            }
        }
        if count == HealthData.fluidLogs.count{
            
            let newLog = FluidLogs()
            if HealthData.fluidLogs.count == 0{
                newLog.fluidType.append(fluid)
                newLog.waterAmountLog.append(amount)
                newLog.serialNumber.append(01)
                //Date Time hell
                newLog.date = giveMeEntireDate()
                print(getDay())
                newLog.day = getDay()
                newLog.timeLog.append(getCurrentTime())
                
                //Resetting all days isItToday and setting true for today
                for i  in HealthData.fluidLogs{
                    i.isItToday = false
                }
                newLog.isItToday = true
                
                HealthData.fluidLogs.append(newLog)
            }
            else{
                newLog.fluidType.append(fluid)
                newLog.waterAmountLog.append(amount)
                newLog.serialNumber.append(01)
                //Date Time hell
                newLog.date = giveMeEntireDate()
                newLog.day = getDay()
                newLog.timeLog.append(getCurrentTime())
                
                //Resetting all days isItToday and setting true for today
                for i  in HealthData.fluidLogs{
                    i.isItToday = false
                }
                newLog.isItToday = true
                
                HealthData.fluidLogs.insert(newLog, at: 0)
            }
            
        }
        saveData()
    }
    
    func giveMeEntireDate()->String{
        let currentDateTime = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: currentDateTime)
        let month = calendar.component(.month, from: currentDateTime)
        let year = calendar.component(.year, from: currentDateTime)
        return "\(day)-\(month)-\(year)"

    }
    
    func getCurrentDate()->Int{
        let currentDateTime = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: currentDateTime)
        return day
    }
    
    func getCurrentTime()->String{
        let currentDateTime = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: currentDateTime)
        let minute = calendar.component(.minute, from: currentDateTime)
        let second = calendar.component(.second, from: currentDateTime)
        return "\(hour):\(minute):\(second)"
    }
    
    func getCurrentMonth()->Int{
        let currentDateTime = Date()
        let calendar = Calendar.current
        let month = calendar.component(.month, from: currentDateTime)
        return month
    }
    
    func getCurrentYear()->Int{
        let currentDateTime = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: currentDateTime)
        return year
    }
    
    func getDay()->String{
        let today = giveMeEntireDate()
        let formatter  = DateFormatter()
        var weekDay: Int = 0
        var day: String = "IDK"
        formatter.dateFormat = "dd-MM-yyyy"
        if let todayDate = formatter.date(from: today){
            let myCalendar = Calendar(identifier: .gregorian)
            let weekDayTemp = myCalendar.component(.weekday, from: todayDate)
            weekDay = weekDayTemp
        }
        if weekDay == 1{
            day = "Sunday"
        }
        else if weekDay == 2{
            day =  "Monday"
        }
        
        else if weekDay == 3{
            day = "Tuesday"
        }
        
        else if weekDay == 4{
            day = "Wedneday"
        }
        
        else if weekDay == 5{
            day = "Thursday"
        }
        
        else if weekDay == 6{
            day = "Friday"
        }
        
        else if weekDay == 7{
            day = "Saturday"
        }
        
        return day
        
    }
    
    
    func saveData(){
        UserDefaults.standard.setValue(HealthData.weightArrayCurrentMonth, forKey: "weightHistoryArrayMonth")
        UserDefaults.standard.setValue(HealthData.datesCurrentMonthArray, forKey: "dateCurrentMonthArray")
        UserDefaults.standard.setValue(HealthData.weightArrayMonthAvg, forKey: "weightArrayOfMonthsAvg")
        UserDefaults.standard.setValue(HealthData.currentMonth, forKey: "currentMonth")
        UserDefaults.standard.setValue(HealthData.firstRun, forKey: "firstRun")
        
        //Lets save Food logs
        saveFoodLog()
        //Lets save Fluid Logs
        saveFluidLog()
    }
    
    func saveFoodLog(){
        if let encoded = try? JSONEncoder().encode(HealthData.foodLogs){
            UserDefaults.standard.set(encoded, forKey: "foodLogs")
        }
    }
    
    func saveFluidLog(){
        if let encoded = try? JSONEncoder().encode(HealthData.fluidLogs){
            print("POSSIBLE")
            UserDefaults.standard.set(encoded, forKey: "fluidLogs")
        }
    }
    
    func retrieveData(){
        //Retrieving weightArray
        if let weightHistoryArray = UserDefaults.standard.object(forKey: "weightHistoryArrayMonth") as? [Double]{
            HealthData.weightArrayCurrentMonth = weightHistoryArray
        }
        
        //Retrieving datesCurrentMonthArray
        if let dateCurrentMonthArray = UserDefaults.standard.object(forKey: "dateCurrentMonthArray") as? [Int]{
            HealthData.datesCurrentMonthArray = dateCurrentMonthArray
        }
        
        //Retrieving weightArrayOfMonthsAvg
        if let weightArrayMonthAvg = UserDefaults.standard.object(forKey: "weightArrayOfMonthsAvg") as? [Double]{
            HealthData.weightArrayMonthAvg = weightArrayMonthAvg
        }
        
        if let currentMonth = UserDefaults.standard.object(forKey: "currentMonth") as? Int{
            HealthData.currentMonth = currentMonth
        }
        if let firstRun = UserDefaults.standard.object(forKey: "firstRun") as? Bool{
            HealthData.firstRun = firstRun
        }
        
        //Retrieving foodLogs
        retrieveFoodLogs()
        retrieveFluidLogs()
    }
    
    func retrieveFoodLogs(){
        if let data = UserDefaults.standard.data(forKey: "foodLogs"),
            let foodLogs = try? JSONDecoder().decode([FoodLogs].self, from: data){
            HealthData.foodLogs = foodLogs
        }
    }
    
    func retrieveFluidLogs(){
        if let data = UserDefaults.standard.data(forKey: "fluidLogs"),
            let fluidLogs = try? JSONDecoder().decode([FluidLogs].self, from: data){
            HealthData.fluidLogs = fluidLogs
        }
    }
}
