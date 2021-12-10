//
//  ViewController.swift
//  Tipster Ahad
//
//  Created by admin on 10/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billLabel: UILabel!
    
    @IBOutlet weak var tipPercent: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipTotal: UILabel!
    
    // incraese 5%
    @IBOutlet weak var tipFive: UILabel!
    @IBOutlet weak var tipFiveLabel: UILabel!
    @IBOutlet weak var tipFiveTotal: UILabel!
    
    // incraese 10%
    @IBOutlet weak var tipTen: UILabel!
    @IBOutlet weak var tipTenLabel: UILabel!
    @IBOutlet weak var tipTenTotal: UILabel!
    
    // Tip slider
    @IBOutlet weak var tipSlider: UISlider!
    
    // Group size
    @IBOutlet weak var groupsizeLabel: UILabel!
    @IBOutlet weak var groupsizeSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billLabel.text = ""
        tipPercent.text = "10%"
        tipFive.text = "15%"
        tipTen.text = "20%"
    }

    // Action Buttons Part
    
    @IBAction func actionButtons(_ sender: UIButton) {
       
        switch sender.titleLabel?.text {
                case "c":
                    billLabel.text! = ""
                    evaluateTip()
                    break
                case "0":
                    if(billLabel.text == "0"){return}
                    billLabel.text! += "0"
                    break
                case ".":
                    if(billLabel.text!.contains(".")) {return}
                    billLabel.text! += "."
                    evaluateTip()
                    break
                case "1":
                    billLabel.text! += "1"
                    evaluateTip()
                    break
                case "2":
                    billLabel.text! += "2"
                    evaluateTip()
                    break
                case "3":
                    billLabel.text! += "3"
                    evaluateTip()
                    break
                case "4":
                    billLabel.text! += "4"
                    evaluateTip()
                    break
                case "5":
                    billLabel.text! += "5"
                    evaluateTip()
                    break
                case "6":
                    billLabel.text! += "6"
                    evaluateTip()
                    break
                case "7":
                    billLabel.text! += "7"
                    evaluateTip()
                    break
                case "8":
                    billLabel.text! += "8"
                    evaluateTip()
                    break
                case "9":
                    billLabel.text! += "9"
                    evaluateTip()
                    break
                default:
                    return
                }
        
            }
        
    // calculate funtion
    func evaluateTip(){

        let firstTip = (tipPercent.text! as NSString).doubleValue
        let secondTip = (tipFive.text! as NSString).doubleValue
        let thirdTip = (tipTen.text! as NSString).doubleValue
        
        let showBill = (billLabel.text! as NSString).doubleValue
        let groupSize = Double(Int(groupsizeSlider.value))
        
        //calculate fist tip -> 10%
        tipLabel.text = String(format: "%.2f", (showBill * firstTip / 100) / groupSize)
        // calculate second Tip -> 15%
        tipFiveLabel.text = String(format: "%.2f", (showBill * secondTip / 100) / groupSize)
        //calculate third tip -> 20%
        tipTenLabel.text = String(format: "%.2f", (showBill * thirdTip / 100) / groupSize)
        
        //calculate total 10% tip
        tipTotal.text = String(format: "%.2f", (showBill * firstTip / 100 + showBill) / groupSize)
        //calculate total 15% tip
        tipFiveTotal.text = String(format: "%.2f", (showBill * secondTip / 100 + showBill) / groupSize)
        //calculate totall 20% tip
        tipTenTotal.text = String(format: "%.2f", (showBill * firstTip / 100 + showBill) / groupSize)
        
    }

    
    // Tip Slider Action
    @IBAction func tipSliderAction(_ sender: UISlider) {
        tipPercent.text = "\(Int(sender.value))%"
        tipFive.text = "\(Int(sender.value) + 5)%"
        tipTen.text = "\(Int(sender.value) + 10)%"
        evaluateTip()
    }
    
    
    // Group size Slider Action
    @IBAction func groupsizeSliderAction(_ sender: UISlider) {
        groupsizeLabel.text = "Group size: \(Int(sender.value))"
        evaluateTip()
    }
    
}
