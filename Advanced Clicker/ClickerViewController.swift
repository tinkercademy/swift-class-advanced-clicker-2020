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
    let animationDuration = 2.0
    let timerDuration = 1.0
    
    @IBOutlet weak var labelFor3: UILabel!
    @IBOutlet weak var labelFor2: UILabel!
    @IBOutlet weak var labelFor1: UILabel!
    @IBOutlet weak var labelForGo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.alpha = 0
        labelFor2.alpha = 0
        labelFor1.alpha = 0
        labelForGo.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Fade out 3, bring in 2
        UIView.animate(withDuration: timerDuration, animations: {
            self.labelFor3.alpha = 0
            self.labelFor3.transform = self.labelFor3.transform.scaledBy(x: 0.1, y: 0.1)
            self.view.backgroundColor = .red
        }) { _ in
            self.labelFor2.alpha = 1
            // Fade out 2, bring in 1
            UIView.animate(withDuration: self.timerDuration, animations: {
                self.labelFor2.alpha = 0
                self.labelFor2.transform = self.labelFor2.transform.scaledBy(x: 0.1, y: 0.1)
                self.view.backgroundColor = .orange
            }) { (_) in
                self.labelFor1.alpha = 1
                // Fade out 1, bring in Go
                UIView.animate(withDuration: self.timerDuration,
                               delay: 0,
                               options: [.curveEaseIn],
                               animations: {
                    self.labelFor1.alpha = 0
                    self.labelFor1.transform = self.labelFor1.transform.scaledBy(x: 0.1, y: 0.1)
                    self.view.backgroundColor = .yellow
                }) { (_) in
                    self.labelForGo.alpha = 1
                    // Expand Go
                    UIView.animate(withDuration: self.timerDuration,
                                   delay: 0,
                                   usingSpringWithDamping: 0.5,
                                   initialSpringVelocity: 0.5,
                                   options: [.curveEaseOut],
                                   animations: {
                        self.labelForGo.alpha = 0
                        self.labelForGo.transform = self.labelForGo.transform.scaledBy(x: 3, y: 3)
                        self.view.backgroundColor = .systemTeal
                    }) { (_) in
                        self.labelForGo.alpha = 0
                        self.label.alpha = 1
                        self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
                    }

                }
            }
        }
        
        
        

        
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
            UIView.animate(withDuration: animationDuration, animations: {
                self.view.backgroundColor = .green
                self.label.alpha = 0
            }) { (_) in
                self.time -= self.animationDuration
                self.performSegue(withIdentifier: "unwindToScores", sender: self)
            }
        }
    }
    
}

