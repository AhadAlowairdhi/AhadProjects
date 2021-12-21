//
//  ViewController.swift
//  Local notifications Ahad
//
//  Created by admin on 20/12/2021.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UIPickerViewDataSource , UIPickerViewDelegate {
    
    var historyList: [String] = []
    let timerPicker = ["5 Minutes","10 Minutes","20 Minutes","30 Minutes"]
    let timeNum = [5,10,20,30]
    
    var timerInterval: TimeInterval = 5
    
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var timerSetLabel: UILabel!
    @IBOutlet weak var cancelSetLabel: UILabel!
    @IBOutlet weak var timePickerOutlet: UIPickerView!
    @IBOutlet weak var timerWorkUntilLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //timePickerOutlet.isHidden = false
        newDay()
    }
    
// picker view section
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            timerPicker.count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return timerPicker[row]
        }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: timerPicker[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        timerInterval = TimeInterval(timeNum[row])
    }

// tool bar Action
    
    // undo action -> cancel
    @IBAction func undoAction(_ sender: UIBarButtonItem) {
        cancelAlert()
    }
    
    @IBAction func listAction(_ sender: UIBarButtonItem) {
    
            totalTimeLabel.text = "Total time: \(Int(timerInterval))"
            timerSetLabel.text = "0 hours, \(Int(timerInterval)) min"
            cancelSetLabel.isHidden = false
            timerWorkUntilLabel.isHidden = true
            timePickerOutlet.isHidden = true
            let string = historyList.joined(separator: "\n")
            cancelSetLabel.text = string
    }
    
    @IBAction func plusAction(_ sender: UIBarButtonItem) {
        newDay()
    }
    
// timer button Action
    @IBAction func startTimerAction(_ sender: UIButton) {
        alertCountdown()
    }
    
 // functions section
    
    // update The values to The New ones after running
         func setValues() {
             
            let minutes: TimeInterval = timerInterval * 60
            let cuttentTime = Date()
            let newTime = Date() + minutes
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm a"
            let date = dateFormatter.string(from: newTime)
            let current = dateFormatter.string(from: cuttentTime)
            
            timerWorkUntilLabel.isHidden = false
            cancelSetLabel.isHidden = false
            timerSetLabel.isHidden = false
            timePickerOutlet.isHidden = false
            timerWorkUntilLabel.text =  "Work until: \(date)"
            cancelSetLabel.text = "\(Int(timerInterval)) Minute Timer Set"
            totalTimeLabel.text = "Total time: \(Int(timerInterval))"
            timerSetLabel.text = "0 hours, \(Int(timerInterval)) min"
            let statement = "\(current) - \(date) \(Int(timerInterval)) Minute Timer"
            historyList.append(statement)
        }
    //Set The Values to be defalut
        func newDay(){
            totalTimeLabel.text = "Total time: 0"
            timerSetLabel.isHidden = true
            cancelSetLabel.isHidden = true
            timerWorkUntilLabel.isHidden = true
            timePickerOutlet.isHidden = false
        }
    
    
// notifications
    //Start Notification Timer
        func startTimer(){
            let center = UNUserNotificationCenter.current()
            
            let content = UNMutableNotificationContent()
            content.title = NSString.localizedUserNotificationString(forKey: "Wake up!", arguments: nil)
            content.body = NSString.localizedUserNotificationString(forKey: "Rise and shine! It's morning time!", arguments: nil)
            content.sound = UNNotificationSound.default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(timerInterval) * 60, repeats: false)
            
            let request = UNNotificationRequest(identifier: "Reminder", content: content, trigger: trigger)
            
            center.add(request) { (error : Error?) in
                if let theError = error {
                    print(theError.localizedDescription)
                }
            }
            setValues()
        }
    
    
// alerts section
    
    // countdown alert
    func alertCountdown(){
        let alertVC = UIAlertController.init(title: "\(Int(timerInterval)) min Countdown", message: "After \(Int(timerInterval)), you'll be notified\n turn you ringer on", preferredStyle: .alert)
                let action = UIAlertAction.init(title: "OK", style: .cancel) { action in
                    self.startTimer()
                }
                alertVC.addAction(action)
                self.present(alertVC, animated: true, completion: nil)
    }
    
    //cancel alert
    func cancelAlert(){
        let alertVC = UIAlertController.init(title: "Cancel current timer?", message: nil, preferredStyle: .alert)
                alertVC.addAction(UIAlertAction.init(title: "Back", style: .cancel, handler: nil))
                
        let action = UIAlertAction.init(title: "Cancel", style: .destructive) { [self] action in
                    self.totalTimeLabel.text = "Total time: 0"
                    self.timerSetLabel.text = "0 hours, 0 min"
                    self.cancelSetLabel.text = "\(Int(self.timerInterval)) Minute Timer Cancelled"
                    self.timerWorkUntilLabel.isHidden = true
                    historyList.append("\(Int(self.timerInterval)) Minute Timer Cancelled")
                    self.timePickerOutlet.isHidden = false
                }
                alertVC.addAction(action)
                self.present(alertVC, animated: true, completion: nil)
    }
    
    
    
    
}

