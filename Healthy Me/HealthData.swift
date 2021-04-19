//
//  HealthData.swift
//  Healthy Me
//
//  Created by Raghav Sharma on 30/06/18.
//  Copyright © 2018 Raghav Sharma. All rights reserved.
//

import Foundation

struct HealthData{
    
    //Weight Hell
    static let months: [Int] = [01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12]
    static var weightArrayCurrentMonth: [Double] = []
    static var weightArrayMonthAvg: [Double] = [0,0,0,0,0,0,0,0,0,0,0,0]
    static var datesCurrentMonthArray: [Int] = []
    static var currentMonth: Int = 0
    
    
    //Food and water Logs
    static var foodLogs: [FoodLogs] = []
    static var fluidLogs:[FluidLogs] = []
    
    
    //Setup stuff. Run the very first time provoked by viewDidLoad() of WelcomeVC
    static var firstRun = false
}
