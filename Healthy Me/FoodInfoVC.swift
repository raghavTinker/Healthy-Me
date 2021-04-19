//
//  FoodInfoVC.swift
//  Healthy Me
//
//  Created by Raghav Sharma on 02/07/18.
//  Copyright © 2018 Raghav Sharma. All rights reserved.
//

import UIKit

class FoodInfoVC: UIViewController {
    var index: Int?
    var date: FoodLogs?
    
    var foodItem: String = ""
    var quantity: String = ""
    var carbs: Double = 0.0
    var proteins: Double = 0.0
    
    let yCoordinateFoodItem: CGFloat = 100.0
    let heightOfLabels: CGFloat = 50.0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = "Food Info"
        foodItem = date!.foodItemArray[index!]
        quantity = date!.quantity[index!]
        carbs = date!.carbLog[index!]
        proteins = date!.proteinLog[index!]
        addFoodItemIntroLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addFoodItemIntroLabel(){
        let label = UILabel(frame: CGRect(x: 10, y: yCoordinateFoodItem, width: 150, height: 50))
        label.text = "Food Item -> "
        label.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(label)
        addFoodItem()
    }
    
    func addFoodItem(){
        let label = UILabel(frame: CGRect(x: 10 + 125 + 15, y: yCoordinateFoodItem, width: view.frame.size.width - (10 + 150 + 15), height: 50))
        label.text = " \(foodItem)"
        //label.backgroundColor = UIColor.magenta
        label.textAlignment = .center
        label.font = UIFont(name: "MarkerFelt-Thin", size: 30)
        
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        
        view.addSubview(label)
        let lineView = UIView(frame: CGRect(x: 0, y: yCoordinateFoodItem + heightOfLabels + 5 + 20, width: view.frame.size.width, height: 1.0))
        lineView.layer.borderWidth = 1.0
        lineView.layer.borderColor = UIColor.black.cgColor
        self.view.addSubview(lineView)
        addQuantityLabelInfo()
    }
    
    func addQuantityLabelInfo(){
        let label = UILabel(frame: CGRect(x: 10, y: yCoordinateFoodItem + heightOfLabels + 5 + 20 + 20, width: 150, height: 50))
        label.text = "Quantity -> "
        label.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(label)
        addQuantity()
    }
    
    func addQuantity(){
        let qty = UILabel(frame: CGRect(x: 10 + 125 + 15, y: yCoordinateFoodItem + heightOfLabels + 5 + 20 + 20, width: view.frame.size.width - (10 + 150 + 15), height: 50))
        qty.text = " \(quantity)"
        //label.backgroundColor = UIColor.magenta
        qty.textAlignment = .center
        qty.font = UIFont(name: "MarkerFelt-Thin", size: 30)
        view.addSubview(qty)
        
        let lineView1 = UIView(frame: CGRect(x: 0, y: yCoordinateFoodItem + heightOfLabels *  2 + 5 + 20 + 20, width: view.frame.size.width, height: 1.0))
        lineView1.layer.borderWidth = 1.0
        lineView1.layer.borderColor = UIColor.black.cgColor
        self.view.addSubview(lineView1)
        addCarbsInfoLabel()
    }
    func addCarbsInfoLabel(){
        let label = UILabel(frame: CGRect(x: 10, y: yCoordinateFoodItem + heightOfLabels * 2 + 5 + 20 + 20 + 20, width: 150, height: 50))
        label.text = "Carbs -> "
        label.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(label)
        addCarbs()
    }
    
    func addCarbs(){
        let qty = UILabel(frame: CGRect(x: 10 + 125 + 15, y: yCoordinateFoodItem + heightOfLabels * 2 + 5 + 20 + 20 + 20, width: view.frame.size.width - (10 + 150 + 15), height: 50))
        qty.text = " \(String(describing: carbs))g"
        //label.backgroundColor = UIColor.magenta
        qty.textAlignment = .center
        qty.font = UIFont(name: "MarkerFelt-Thin", size: 30)
        view.addSubview(qty)
        
        let lineView1 = UIView(frame: CGRect(x: 0, y: yCoordinateFoodItem + heightOfLabels *  3 + 5 + 20 + 20 + 20 , width: view.frame.size.width, height: 1.0))
        lineView1.layer.borderWidth = 1.0
        lineView1.layer.borderColor = UIColor.black.cgColor
        self.view.addSubview(lineView1)
        addProteinsInfoLabel()
    }
    
    func addProteinsInfoLabel(){
        let label = UILabel(frame: CGRect(x: 10, y: yCoordinateFoodItem + heightOfLabels * 3 + 5 + 20 + 20 + 20 + 20, width: 150, height: 50))
        label.text = "Proteins -> "
        label.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(label)
        addProteins()
    }
    
    func addProteins(){
        let qty = UILabel(frame: CGRect(x: 10 + 125 + 15, y: yCoordinateFoodItem + heightOfLabels * 3 + 5 + 20 + 20 + 20 + 20, width: view.frame.size.width - (10 + 150 + 15), height: 50))
        qty.text = " \(String(describing: proteins))g"
        //label.backgroundColor = UIColor.magenta
        qty.textAlignment = .center
        qty.font = UIFont(name: "MarkerFelt-Thin", size: 30)
        view.addSubview(qty)
        details()
    }
    
    func details(){
        
    }
}
