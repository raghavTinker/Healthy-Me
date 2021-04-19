//
//  FluidEntryVC.swift
//  Healthy Me
//
//  Created by Raghav Sharma on 10/07/18.
//  Copyright © 2018 Raghav Sharma. All rights reserved.
//

import UIKit

class FluidEntryVC: UIViewController {

    let fluidNameButton = UIButton(frame: CGRect(x: 37, y: 200, width: 300, height: 60))
    let fluidAmountButton = UIButton(frame: CGRect(x: 37, y: 200 + 100, width: 300, height: 60))
    let errorLabel: UILabel = UILabel()

    var fluidName: String = ""
    var fluidAmount: Double = 0.0
    var done: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red:0.68, green:0.85, blue:0.90, alpha:1.0)
        title = "Fluid Logger"
        
        addFluidNameButton()
        addFluidAmountButton()
        addDoneButton()
        errorLabel.frame = CGRect(x: 0, y: 450 + 20 + 100, width: view.frame.size.width, height: 60)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addFluidNameButton(){
        fluidNameButton.backgroundColor = UIColor.brown
        fluidNameButton.titleLabel?.textColor = UIColor.white
        fluidNameButton.titleLabel?.font = UIFont(name: "Avenir-Light", size: 20)
        fluidNameButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        fluidNameButton.layer.cornerRadius = 20
        
        fluidNameButton.setTitle("Fluid Name", for: .normal)
        fluidNameButton.addTarget(self, action: #selector(enterFluidType), for: .touchUpInside)
        view.addSubview(fluidNameButton)
    }
    
    func addFluidAmountButton(){
        
        fluidAmountButton.backgroundColor = UIColor(red:0.50, green:0.00, blue:0.25, alpha:1.0)
        fluidAmountButton.titleLabel?.textColor = UIColor.white
        fluidAmountButton.titleLabel?.font = UIFont(name: "Avenir-Light", size: 20)
        fluidAmountButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        fluidAmountButton.layer.cornerRadius = 20
        
        fluidAmountButton.setTitle("Fluid Amount", for: .normal)
        fluidAmountButton.addTarget(self, action: #selector(enterFluidAmount), for: .touchUpInside)
        view.addSubview(fluidAmountButton)
    }
    
    func addDoneButton(){
        let doneButton: UIButton = UIButton(frame: CGRect(x: 0, y: 200 + 200 + 100, width: view.frame.size.width, height: 60))
        doneButton.backgroundColor = UIColor.blue
        doneButton.titleLabel?.textColor = UIColor.white
        doneButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        doneButton.setTitle("Done", for: .normal)
        doneButton.addTarget(self, action: #selector(doneCheck), for: .touchUpInside)
        view.addSubview(doneButton)
    }
    
    @objc func enterFluidType(){
        let fluidName = UIAlertController(title: "What is the fluid?", message: nil, preferredStyle:.alert)
        fluidName.addTextField{(textField)in
            textField.placeholder = "Water"
            textField.keyboardType = .alphabet
            
            fluidName.addAction(UIAlertAction(title: "OK", style: .default, handler:{(action) in
                if let text = fluidName.textFields?[0].text{
                    if let fluidNameInput = text as? String{
                        if fluidNameInput.count > 0{
                            self.fluidName = fluidNameInput
                            self.done.append(1)
                            self.fluidNameButton.isEnabled = false
                            self.fluidNameButton.setTitle("👍", for: .disabled)
                            self.fluidNameButton.alpha = 0.5
                        }
                    }
                }
            }))
            self.present(fluidName, animated: true, completion: nil)
        }
        
    }
    
    
    @objc func enterFluidAmount(){
        let fluidAmount = UIAlertController(title: "What is the amount of fluid? (in ml)", message: nil, preferredStyle:.alert)
        fluidAmount.addTextField{(textField)in
            textField.placeholder = "15"
            textField.keyboardType = .decimalPad
            
            fluidAmount.addAction(UIAlertAction(title: "OK", style: .default, handler:{(action) in
                if let text = fluidAmount.textFields?[0].text{
                    print(text)
                    if let fluidAmountInput = Double(text) as? Double{
                        self.fluidAmount = fluidAmountInput
                        self.done.append(1)
                        self.fluidAmountButton.isEnabled = false
                        self.fluidAmountButton.setTitle("👍", for: .disabled)
                        self.fluidAmountButton.alpha = 0.5
                    }
                }
            }))
            self.present(fluidAmount, animated: true, completion: nil)
        }
    }
    
    @objc func doneCheck(){
        //print("HELLO")
        errorLabel.text = ""
        if done.count == 2{
            print("HI")
            errorLabel.text = "Success!!"
            BasicFunctionality().addFluidEntry(amount: fluidAmount, fluid: fluidName)
            
            errorLabel.textColor = UIColor.black
            errorLabel.font = UIFont.boldSystemFont(ofSize: UIFont.systemFontSize + 10)
            errorLabel.textAlignment = .center
            errorLabel.lineBreakMode = .byWordWrapping
            errorLabel.font = UIFont.boldSystemFont(ofSize: UIFont.systemFontSize + 10)
            errorLabel.numberOfLines = 2
            view.addSubview(errorLabel)
            
            navigationController?.popToRootViewController(animated: true)
            
        }
        else{
            //print("Bye")
            errorLabel.text = "Please fill in all values. Check again!"
            errorLabel.textColor = UIColor.red
            errorLabel.font = UIFont.boldSystemFont(ofSize: UIFont.systemFontSize + 10)
            errorLabel.textAlignment = .center
            errorLabel.lineBreakMode = .byWordWrapping
            errorLabel.numberOfLines = 2
            view.addSubview(errorLabel)
        }
    }
    
    
}
