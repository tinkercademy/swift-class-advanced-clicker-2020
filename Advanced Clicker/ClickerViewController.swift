//
//  ViewController.swift
//  Advanced Clicker
//
//  Created by YJ Soon on 29/8/20.
//  Copyright © 2020 Tinkercademy. All rights reserved.
//

import UIKit

class ClickerViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var counter = 0
    var time = 0.0
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        time += 0.1
    }

    @IBAction func tapped(_ sender: Any) {
        counter += 1
        label.text = "\(counter)"
        if counter == 30 {
            print("You done")
            print("You took \(time) seconds")
            performSegue(withIdentifier: "unwindToScores", sender: self)
        }
    }
    
}

