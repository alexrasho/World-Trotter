//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Alex Rasho on 1/31/18.
//  Copyright © 2018 Alex Rasho. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("convText", comment: "")
        updateCelsiusLabel()
        celsiusText.text = NSLocalizedString("celText", comment: "")
        ferText.text = NSLocalizedString("ferText", comment: "")
        reallyText.text = NSLocalizedString("realText", comment: "")
        print("ConversionViewController loaded its view")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
//        let calendar = NSCalendar.currentCalendar()
        //        let hour = calendar.component(.Hour, fromDate: NSDate())
        
        let dayColor = UIColor(red:0.96, green:0.96, blue:0.95, alpha:1.0)
        let nightColor = UIColor(red:0.04, green:0.04, blue:0.05, alpha:1.0)
        self.view.backgroundColor = nightColor
        reallyText.textColor = dayColor
        ferText.textColor = dayColor
        celsiusText.textColor = dayColor

    //        if hour >= 8 && hour <= 20 {
    //            self.view.backgroundColor = dayColor
    //        } else {
    //            self.view.backgroundColor = nightColor
    //        }
    //        }
        print("ConversionViewController view will appear...")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        print("ConversionViewController's view did appear...")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        print("ConversionViewController's view will disappear...");
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated);
        print("ConversionViewController's view did disappear...");
    }
    
    // MARK: -
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet weak var celsiusText: UILabel!
    @IBOutlet weak var ferText: UILabel!
    @IBOutlet weak var reallyText: UILabel!
    var fahrenheitValue: Measurement<UnitTemperature>? {
    didSet {
        updateCelsiusLabel()
    }
}
    
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
            }
        }

    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    

    
    @IBOutlet var textField: UITextField!
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        
        if existingTextHasDecimalSeparator != nil,
            replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField)
    {
    //    var clr: UIColor = UIColor(red1.0, green:0.0, blue:0.0, alpha:1.0);
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
}
        //celsiusLabel.text = textField.text
@IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
    textField.resignFirstResponder()
}
}


//let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 150)
//let firstView = UIView(frame: firstFrame)
//firstView.backgroundColor = UIColor.blue
//view.addSubview(firstView)
//
//let secondFrame = CGRect(x: 20, y: 30, width: 50, height: 50)
//let secondView = UIView(frame: secondFrame)
//secondView.backgroundColor = UIColor.green
//firstView.addSubview(secondView)
