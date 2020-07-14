//
//  ViewController.swift
//  UserDefaults0714
//
//  Created by leslie on 7/14/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counter: UIStepper!
    @IBOutlet weak var counterLbl: UILabel!
    @IBOutlet weak var reminderLbl: UILabel!
    
    var defaultValues: UserDefaults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///Get a reference to the UserDefaults object.
        defaultValues = UserDefaults.standard
        
        if let number = defaultValues.object(forKey: "counter") as? Double {
            counter.value = number
            counterLbl.text = String(number)
        }
        
        //TODO: To keep track of the time the user has spent without using the app.
        if let lastDate = defaultValues.object(forKey: "lastDate") as? Date {
            ///Get a reference to the user’s current calendar object
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: lastDate, to: Date())
            let dateDifference = "\(components.year!) Years, \(components.month!) Months, \(components.day!) days, \(components.hour!) hours, \(components.minute!) minutes, \(components.second!) seconds"
            reminderLbl.text = dateDifference
            
        }
        defaultValues.set(Date(), forKey: "lastDate")
    }

    @IBAction func incrementValue(_ sender: UIStepper) {
        let current = sender.value
        
        defaultValues.set(current, forKey: "counter")
        counterLbl.text = String(current)
    }
    
}

