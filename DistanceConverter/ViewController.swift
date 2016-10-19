//
//  ViewController.swift
//  DistanceConverter
//
//  Created by Juan Manuel Jimenez Sanchez on 8/10/16.
//  Copyright © 2016 Juan Manuel Jimenez Sanchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var distanceTextField: UITextField!
    @IBOutlet var originSegmentedControl: UISegmentedControl!
    @IBOutlet var destinationSegmentControl: UISegmentedControl!
    @IBOutlet var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func distanceTextFieldChanged(_ sender: UITextField) {
        convertProcess()
    }
    
    @IBAction func originSegmentedPressed(_ sender: UISegmentedControl) {
        convertProcess()
    }
    
    @IBAction func destinationSegmentedPressed(_ sender: UISegmentedControl) {
        convertProcess()
    }

    func convertProcess() {
        let originDistanceType = originSegmentedControl.selectedSegmentIndex
        let destinationDistanceType = destinationSegmentControl.selectedSegmentIndex
        
        //Si el campo no está vacío y además es un número...
        if let originDistanceStr = distanceTextField.text, let originDistanceValue = Double(originDistanceStr) {
            var convertedValue = ""
            
            if originDistanceType == 0 {//From Miles
                if destinationDistanceType == 0 {//To Miles
                    convertedValue = String(format: "%.2f", originDistanceValue)
                } else if destinationDistanceType == 1 {//To Km
                    convertedValue = String(format: "%.2f", originDistanceValue * 1.609)
                } else if destinationDistanceType == 2 {//To Yards
                    convertedValue = String(format: "%.2f", originDistanceValue * 1760)
                } else if destinationDistanceType == 3 {//To Meters
                    convertedValue = String(format: "%.2f", originDistanceValue * 1609)
                }
            } else if originDistanceType == 1 {//From Km
                if destinationDistanceType == 0 {//To Miles
                    convertedValue = String(format: "%.2f", originDistanceValue * 0.621)
                } else if destinationDistanceType == 1 {//To Km
                    convertedValue = String(format: "%.2f", originDistanceValue)
                } else if destinationDistanceType == 2 {//To Yards
                    convertedValue = String(format: "%.2f", originDistanceValue * 1093.613)
                } else if destinationDistanceType == 3 {//To Meters
                    convertedValue = String(format: "%.2f", originDistanceValue * 1000)
                }
            } else if originDistanceType == 2 {//From Yards
                if destinationDistanceType == 0 {//To Miles
                    convertedValue = String(format: "%.2f", originDistanceValue * 0.000568)
                } else if destinationDistanceType == 1 {//To Km
                    convertedValue = String(format: "%.2f", originDistanceValue * 0.000914)
                } else if destinationDistanceType == 2 {//To Yards
                    convertedValue = String(format: "%.2f", originDistanceValue)
                } else if destinationDistanceType == 3 {//To Meters
                    convertedValue = String(format: "%.2f", originDistanceValue * 0.914)
                }
            } else if originDistanceType == 3 {//From Meters
                if destinationDistanceType == 0 {//To Miles
                    convertedValue = String(format: "%.2f", originDistanceValue * 0.000621)
                } else if destinationDistanceType == 1 {//To Km
                    convertedValue = String(format: "%.2f", originDistanceValue * 0.001)
                } else if destinationDistanceType == 2 {//To Yards
                    convertedValue = String(format: "%.2f", originDistanceValue * 1.093)
                } else if destinationDistanceType == 3 {//To Meters
                    convertedValue = String(format: "%.2f", originDistanceValue)
                }
            }
            
            let originText = destinationTypeString(type: originDistanceType)
            let destinationText = destinationTypeString(type: destinationDistanceType)
            resultLabel.text = "\(originDistanceValue) \(originText) = \(convertedValue) \(destinationText)"
        } else {
            resultLabel.text = "You need to enter a number to convert"
        }
    }
    
    func destinationTypeString(type: Int) -> String {
        if type == 0 {
            return "Miles"
        } else if type == 1 {
            return "Km"
        } else if type == 2 {
            return "Yards"
        } else if type == 3 {
            return "Meters"
        } else {
            return ""
        }
    }
}

