//
//  MonthGraphVC.swift
//  Healthy Me
//
//  Created by Raghav Sharma on 01/07/18.
//  Copyright © 2018 Raghav Sharma. All rights reserved.
//

import UIKit
import SwiftChart

class MonthGraphVC: UIViewController{
    var graph = Chart()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red:0.81, green:1.00, blue:0.80, alpha:1.0)
        title = "Monthly Graph"
        addGraph()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func addGraph(){
        graph = Chart(frame: CGRect(x:0, y:100, width: view.frame.size.width - 20, height:300))
        graph.yLabelsFormatter = {String(Double($1)) + "kg"}
        
        view.addSubview(graph)
        addNote()
    }
    
    func addNote(){
        let note = UILabel(frame: CGRect(x: 0, y: 100 + 300 + 10, width: view.frame.size.width, height: 45))
        note.text = "NOTE"
        note.textAlignment = .center
        note.font = UIFont(name: "MarkerFelt-Thin", size: UIFont.systemFontSize + 20)
        view.addSubview(note)
        addXLabel()
    }
    func addXLabel(){
        let xAxisDescription = UILabel(frame: CGRect(x: 0, y: 100 + 300 + 20 + 10 + 10, width: view.frame.size.width, height: 45))
        xAxisDescription.text = "X axis is the date observations"
        xAxisDescription.textAlignment = .center
        xAxisDescription.font = UIFont(name: "Avenir-Light", size: UIFont.systemFontSize + 10)
        view.addSubview(xAxisDescription)
        addYLabel()
    }
    
    func addYLabel(){
        let yAxisDescription = UILabel(frame: CGRect(x: 0, y: 100 + 300 + 50 + 10 + 10, width: view.frame.size.width, height: 45))
        yAxisDescription.text = "Y axis is the weight observations"
        yAxisDescription.textAlignment = .center
        yAxisDescription.font = UIFont(name: "Avenir-Light", size: UIFont.systemFontSize + 10)
        view.addSubview(yAxisDescription)
    }
}
