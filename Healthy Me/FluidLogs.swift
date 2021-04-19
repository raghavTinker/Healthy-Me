//
//  FluidLogs.swift
//  Healthy Me
//
//  Created by Raghav Sharma on 07/07/18.
//  Copyright © 2018 Raghav Sharma. All rights reserved.
//

import Foundation

class FluidLogs: Codable{
    var date: String = ""
    var day: String = ""
    var timeLog: [String] = []
    
    var waterAmountLog: [Double] = []
    var fluidType: [String] = []
    
    var serialNumber: [Int] = []
    var isItToday: Bool = false
}
