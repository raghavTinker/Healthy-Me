//
//  FoodLogs.swift
//  Healthy Me
//
//  Created by Raghav Sharma on 01/07/18.
//  Copyright © 2018 Raghav Sharma. All rights reserved.
//

import Foundation

class FoodLogs: Codable{
    var date: String = ""
    var day: String = ""
    var logTimeArray: [String] = []
    var isItToday: Bool = false
    
    var foodItemArray: [String] = []
    var carbLog: [Double] = []
    var proteinLog: [Double] = []
    var quantity: [String] = []
    
    var serialNumber: [Int] = []
    
    //Sections
    
    var month: Int = 0
    
    var year: Int = 0
}
