//
//  ViewController.swift
//  CatchTheKennyGame
//
//  Created by Eren on 3.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0
    var timer = Timer()
    var score = 0
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for tag in 1001...1009 {
            (self.view.viewWithTag(tag) as? UIButton)?.imageView?.contentMode = .scaleAspectFit
            (self.view.viewWithTag(tag) as? UIButton)?.isHidden = true
            
        }
    }
    
    @IBAction func start(_ sender: Any) {
        startButton.isUserInteractionEnabled = false
        counter = 10
        timeLabel.text = "Time: \(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
    }
    
    @objc func timerFunc() {
        timeLabel.text = "Time : \(counter)"
        counter -= 1
        let randomButtonTag = Int.random(in: 1001...1009)
        for tag in 1001...1009 {
            (self.view.viewWithTag(tag) as? UIButton)?.isUserInteractionEnabled = true
            
            if randomButtonTag == tag {
                (self.view.viewWithTag(tag) as? UIButton)?.isHidden = false

            } else {
                (self.view.viewWithTag(tag) as? UIButton)?.isHidden = true
            }
        }
        if counter == 0 {
            startButton.isUserInteractionEnabled = true
            timer.invalidate()
            timeLabel.text = "Time over"
        }
    }
    
    @IBAction func kennySelected(sender: UIButton) {
        print(sender.tag)
        (self.view.viewWithTag(sender.tag) as? UIButton)?.isUserInteractionEnabled = false
        score += 1
        scoreLabel.text = "Score : \(score)"
    }
}




