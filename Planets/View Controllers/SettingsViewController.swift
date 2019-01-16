//
//  SettingsViewController.swift
//  Planets
//
//  Created by Nelson Gonzalez on 1/16/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var shouldShowPlutoSwitch: UISwitch!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    
    }
    

    @IBAction func changeShouldShowPluto(_ sender: UISwitch) {
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(sender.isOn, forKey: .shouldShowPlutoKey)
        
    }
    
    private func updateViews() {
        let userDefaults = UserDefaults.standard
        shouldShowPlutoSwitch.isOn = userDefaults.bool(forKey: .shouldShowPlutoKey)
    }
    
}
