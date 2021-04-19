//
//  FluidInfoVCViewController.swift
//  Healthy Me
//
//  Created by Raghav Sharma on 12/07/18.
//  Copyright © 2018 Raghav Sharma. All rights reserved.
//

import UIKit

class FluidInfoVCViewController: UIViewController {
    
    var date: FluidLogs?
    var index: Int = 0
    var fluidItem: String = ""
    var fluidAmount: Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red:0.50, green:0.80, blue:1.00, alpha:1.0)
        
        title = "Log Detail"

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Important Stuff
    func setup(){
        if let date = date{
            fluidItem = date.fluidType[index]
            fluidAmount = date.waterAmountLog[index]
        }
        else{
            print("Error")
            navigationController?.pushViewController(WelcomeVC(), animated: true)
        }
        addUIElements()
    }
    
    func addUIElements(){
        addFluidIntroLabel()
        addFluidName()
        addAmountLabelInfo()
        addAmount()
    }
    
    func addFluidIntroLabel(){
        let label = UILabel(frame: CGRect(x: 10, y: 100, width: 150, height: 50))
        label.text = "Fluid -> "
        label.font = UIFont.boldSystemFont(ofSize: 30)
        view.addSubview(label)
    }
    
    func addFluidName(){
        let label = UILabel(frame: CGRect(x: 10 + 125 + 15, y: 100, width: view.frame.size.width - (10 + 150 + 15), height: 50))
        label.text = "\(fluidItem)"
        //label.backgroundColor = UIColor.magenta
        label.textAlignment = .center
        label.font = UIFont(name: "MarkerFelt-Thin", size: 35)
        
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        
        view.addSubview(label)
        let lineView = UIView(frame: CGRect(x: 0, y: 100 + 50 + 10 + 20, width: view.frame.size.width, height: 1.0))
        lineView.layer.borderWidth = 1.0
        lineView.layer.borderColor = UIColor.black.cgColor
        self.view.addSubview(lineView)
        //addQuantityLabelInfo()
    }
    func addAmountLabelInfo(){
        let label = UILabel(frame: CGRect(x: 10, y: 120 + 50 + 20 + 10, width: 150, height: 50))
        label.text = "Amount -> "
        label.font = UIFont.boldSystemFont(ofSize: 30)
        view.addSubview(label)
    }
    
    func addAmount(){
        let qty = UILabel(frame: CGRect(x: 10 + 125 + 15, y: 120 + 50  + 20 + 10, width: view.frame.size.width - (10 + 150 + 15), height: 50))
        qty.text = " \(fluidAmount)ml"
        //label.backgroundColor = UIColor.magenta
        qty.textAlignment = .center
        qty.font = UIFont(name: "MarkerFelt-Thin", size: 35)
        view.addSubview(qty)
    }
}
