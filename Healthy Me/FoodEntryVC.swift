//
//  FoodEntryVC.swift
//  Healthy Me
//
//  Created by Raghav Sharma on 30/06/18.
//  Copyright © 2018 Raghav Sharma. All rights reserved.
//

import UIKit

class FoodEntryVC: UIViewController {
    
    var foodItem: String = ""
    var quantity: String = ""
    var carbs: Double = 0.0
    var proteins: Double = 0.0
    
    var done: [Int] = []

    let foodItemButton = UIButton(frame: CGRect(x: 37, y: 100, width: 300, height: 60))
    let quantityButton = UIButton(frame: CGRect(x: 37, y: 200, width: 300, height: 60))
    let carbsButton = UIButton(frame: CGRect(x: 37, y: 300, width: 300, height: 60))
    let proteinButton = UIButton(frame: CGRect(x: 37, y: 400, width: 300, height: 60))
    let errorLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red:0.81, green:1.00, blue:0.80, alpha:1.0)
        title = "New Food Entry"
        errorLabel.frame = CGRect(x: 0, y: 550 + 20, width: view.frame.size.width, height: 60)
        addNewFoodItemButton()
        addQuantityButton()
        addCarbsButton()
        addProteinButton()
        addDoneButton()
    }
    
    func addNewFoodItemButton(){
        foodItemButton.backgroundColor = UIColor.blue
        foodItemButton.titleLabel?.textColor = UIColor.white
        foodItemButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        foodItemButton.layer.cornerRadius = 20
        
        foodItemButton.setTitle("Food Item", for: .normal)
        foodItemButton.addTarget(self, action: #selector(addItem), for: .touchUpInside)
        view.addSubview(foodItemButton)
    }
    
    func addCarbsButton(){
        carbsButton.backgroundColor = UIColor.brown
        carbsButton.titleLabel?.textColor = UIColor.white
        carbsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        carbsButton.layer.cornerRadius = 20
        
        carbsButton.setTitle("Carbs Amount", for: .normal)
        carbsButton.addTarget(self, action: #selector(addCarbs), for: .touchUpInside)
        view.addSubview(carbsButton)
    }
    
    func addProteinButton(){
        proteinButton.backgroundColor = UIColor.brown
        proteinButton.titleLabel?.textColor = UIColor.white
        proteinButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        proteinButton.layer.cornerRadius = 20
        
        proteinButton.setTitle("Protein Amount", for: .normal)
        proteinButton.addTarget(self, action: #selector(addProteins), for: .touchUpInside)
        view.addSubview(proteinButton)
    }
    
    func addQuantityButton(){
        quantityButton.backgroundColor = UIColor.brown
        quantityButton.titleLabel?.textColor = UIColor.white
        quantityButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        quantityButton.layer.cornerRadius = 20
        
        quantityButton.setTitle("Quantity", for: .normal)
        quantityButton.addTarget(self, action: #selector(addQuantity), for: .touchUpInside)
        view.addSubview(quantityButton)
    }
    
    func addDoneButton(){
        let doneButton: UIButton = UIButton(frame: CGRect(x: 0, y: 500, width: view.frame.size.width, height: 60))
        doneButton.backgroundColor = UIColor.red
        doneButton.titleLabel?.textColor = UIColor.white
        doneButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        doneButton.setTitle("Done", for: .normal)
        doneButton.addTarget(self, action: #selector(doneCheck), for: .touchUpInside)
        view.addSubview(doneButton)
    }
    
    @objc func addItem(){
        let foodItemInput = UIAlertController(title: "What is the food item?", message: nil, preferredStyle:.alert)
        foodItemInput.addTextField{(textField)in
            textField.placeholder = "Burger"
            textField.keyboardType = .alphabet
            
            foodItemInput.addAction(UIAlertAction(title: "OK", style: .default, handler:{(action) in
                if let text = foodItemInput.textFields?[0].text{
                    if let foodItemInput = text as? String{
                        if foodItemInput.count > 0{
                            self.foodItem = foodItemInput
                            self.foodItemButton.isEnabled = false
                            self.done.append(1)
                            self.foodItemButton.setTitle("👍", for: .disabled)
                            self.foodItemButton.alpha = 0.5
                        }
                    }
                }
            }))
            self.present(foodItemInput, animated: true, completion: nil)
        }
    }
    
    @objc func addQuantity(){
        let quantityString = UIAlertController(title: "How much of it did you eat?", message: nil, preferredStyle:.alert)
        quantityString.addTextField{(textField)in
            textField.placeholder = "2 plates"
            textField.keyboardType = .alphabet
            
            quantityString.addAction(UIAlertAction(title: "OK", style: .default, handler:{(action) in
                if let text = quantityString.textFields?[0].text{
                    if let quantityInput = text as? String{
                        if quantityInput.count > 0{
                            self.quantity = quantityInput
                            self.quantityButton.isEnabled = false
                            self.done.append(1)
                            self.quantityButton.setTitle("👍", for: .disabled)
                            self.quantityButton.alpha = 0.5
                        }
                      
                    }
                }
            }))
            self.present(quantityString, animated: true, completion: nil)
        }
    }
    
    @objc func addCarbs(){
        let carbsDouble = UIAlertController(title: "How much carbs were there in the amount of food item you ate? (in grams)", message: nil, preferredStyle:.alert)
        carbsDouble.addTextField{(textField)in
            textField.placeholder = "65.3"
            textField.keyboardType = .decimalPad
            
            carbsDouble.addAction(UIAlertAction(title: "OK", style: .default, handler:{(action) in
                if let text = carbsDouble.textFields?[0].text{
                    if let carbsInput = Double(text){
                        self.carbs = carbsInput
                        self.carbsButton.isEnabled = false
                        self.done.append(1)
                        self.carbsButton.setTitle("👍", for: .disabled)
                        self.carbsButton.alpha = 0.5
                    }
                }
            }))
            self.present(carbsDouble, animated: true, completion: nil)
        }
    }
    
    @objc func addProteins(){
        let proteinsDouble = UIAlertController(title: "How much proteins were there in the amount of food item you ate? (in grams)", message: nil, preferredStyle:.alert)
        proteinsDouble.addTextField{(textField)in
            textField.placeholder = "65.3"
            textField.keyboardType = .decimalPad
            
            proteinsDouble.addAction(UIAlertAction(title: "OK", style: .default, handler:{(action) in
                if let text = proteinsDouble.textFields?[0].text{
                    if let proteinsInput = Double(text){
                        self.proteins = proteinsInput
                        self.proteinButton.isEnabled = false
                        self.proteinButton.setTitle("👍", for: .disabled)
                        self.proteinButton.alpha = 0.5
                        self.done.append(1)
                    }
                }
            }))
            self.present(proteinsDouble, animated: true, completion: nil)
        }
    }
    
    @objc func doneCheck(){
        
        print("HELLO")
        errorLabel.text = ""
        if done.count == 4{
            print("HI")
            errorLabel.text = "Success!!"
            errorLabel.textColor = UIColor.black
            errorLabel.font = UIFont.boldSystemFont(ofSize: UIFont.systemFontSize + 10)
            errorLabel.textAlignment = .center
            errorLabel.lineBreakMode = .byWordWrapping
            errorLabel.numberOfLines = 2
            view.addSubview(errorLabel)
            
            BasicFunctionality().addFoodLog(foodItem: foodItem, carbs: carbs, protein: proteins, quantity: quantity)
            errorLabel.font = UIFont.boldSystemFont(ofSize: UIFont.systemFontSize + 10)
            navigationController?.popToRootViewController(animated: true)
            
        }
        else{
            print("Bye")
            errorLabel.text = "Please fill in all values. Check again!"
            errorLabel.textColor = UIColor.red
            errorLabel.font = UIFont.boldSystemFont(ofSize: UIFont.systemFontSize + 10)
            errorLabel.textAlignment = .center
            errorLabel.lineBreakMode = .byWordWrapping
            errorLabel.numberOfLines = 2
            view.addSubview(errorLabel)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
