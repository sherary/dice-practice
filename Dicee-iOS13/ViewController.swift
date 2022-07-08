//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var left: Int = 0
    var right: Int = 0
    var counter: Int = 0
    let pickerOptions: [String] = [" ", "Increment", "Random"]
    var selection: Int = 0
    
    @IBOutlet weak var diceImageLeft: UIImageView!
    @IBOutlet weak var labelLeft: UILabel!
    @IBOutlet weak var diceImageRight: UIImageView!
    @IBOutlet weak var labelRight: UILabel!
    @IBOutlet weak var labelCounter: UILabel!
    @IBOutlet weak var pickMode: UIPickerView!
    @IBOutlet weak var pickerLabel: UILabel!
    
    func rollIncrement() {
        if counter == 0 {
            left += 1
            counter += 1
            labelLeft.text = "\(left)"
        } else {
            if counter % 2 != 0 {
                right += 1
                counter += 1
                labelRight.text = "\(right)"
            } else {
                left += 1
                counter += 1
                labelLeft.text = "\(left)"
            }
        }
        labelCounter.text = "\(counter)"
    }
    
    func rollRandom() {
        left = Int.random(in: 1...6)
        right = Int.random(in: 1...6)
        counter += 1
        
        labelLeft.text = "\(left)"
        labelRight.text = "\(right)"
        
        let numbers = ["One", "Two", "Three", "Four", "Five", "Six"]
        let dice = "Dice"
        
        diceImageLeft.image = UIImage(named: dice + numbers[left - 1])
        diceImageRight.image = UIImage(named: dice + numbers[right - 1])
        
        labelCounter.text = "\(counter)"
    }
    
    @IBAction func rollButtonTapped(_ sender: UIButton) {
        switch selection {
        case 1:
            rollIncrement()
            break
        case 2:
            rollRandom()
            break
        default:
            pickerLabel.textColor = UIColor.red
            pickerLabel.text = "Must pick one"
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.pickMode.delegate = self
        self.pickMode.dataSource = self
        
        labelLeft.text = "\(left)"
        labelRight.text = "\(right)"
        labelCounter.text = "\(counter)"
         
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 1:
            selection = 1
            break
        case 2:
            selection = 2
            break
        default:
            selection = 0
            break
        }
    }
    
}

