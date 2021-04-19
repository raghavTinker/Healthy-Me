//
//  WeightYearVC.swift
//  Healthy Me
//
//  Created by Raghav Sharma on 01/07/18.
//  Copyright © 2018 Raghav Sharma. All rights reserved.
//

import UIKit
import SwiftChart

class WeightYearVC: UIViewController {
    var graph = Chart()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red:0.81, green:1.00, blue:0.80, alpha:1.0)
        title = "Year Graph"
        addGraph()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func addGraph(){
        graph = Chart(frame: CGRect(x:0, y:200, width: view.frame.size.width - 20, height:300))
        graph.yLabelsFormatter = {String(Int($1)) + "kg"}
        var data:[(x: Int, y:Double)] = []
        var count: Int = 0
        for weight in HealthData.weightArrayMonthAvg{
            var dictionaryForEachCoordinate:(x: Int, y: Double)
            dictionaryForEachCoordinate.x = HealthData.months[count]
            dictionaryForEachCoordinate.y = weight
            data.append(dictionaryForEachCoordinate)
            count = count + 1
        }
        print(data)
        let series = ChartSeries(data: data)
        //let newData:[(x:Int, y: Double)] = [(x: 1, y:2.0),(x:3, y:4.0),(x:4, y:6.0)]
        //let newSeries = ChartSeries(data: newData)
        graph.xLabelsSkipLast = false
        graph.add(series)
        series.area = true
        graph.labelFont = UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)
        view.addSubview(graph)
        addNote()
    }
    
    func addNote(){
        let note = UILabel(frame: CGRect(x: 0, y: 200 + 300 + 50, width: view.frame.size.width, height: 45))
        note.text = "NOTE"
        note.textAlignment = .center
        note.font = UIFont(name: "MarkerFelt-Thin", size: UIFont.systemFontSize + 20)
        view.addSubview(note)
        addXLabel()
    }
    func addXLabel(){
        let xAxisDescription = UILabel(frame: CGRect(x: 0, y: 200 + 50 + 300 + 50, width: view.frame.size.width, height: 45))
        xAxisDescription.text = "X axis is the month observations"
        xAxisDescription.textAlignment = .center
        xAxisDescription.font = UIFont(name: "Avenir-Light", size: UIFont.systemFontSize + 5)
        view.addSubview(xAxisDescription)
        addYLabel()
    }
    
    func addYLabel(){
        let yAxisDescription = UILabel(frame: CGRect(x: 0, y: 200 + 50 + 300 + 50 + 50, width: view.frame.size.width, height: 45))
        yAxisDescription.text = "Y axis is the average weight observations"
        yAxisDescription.textAlignment = .center
        yAxisDescription.font = UIFont(name: "Avenir-Light", size: UIFont.systemFontSize + 5)
        view.addSubview(yAxisDescription)
    }

}
