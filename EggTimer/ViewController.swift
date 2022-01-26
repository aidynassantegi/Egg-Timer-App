//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

 
class ViewController: UIViewController {
    let eggTimes : [String:Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    var timer = Timer()
    var totalTime: Int?
    var progresCount: Float = 0
    var player: AVAudioPlayer!
    
    @IBOutlet weak var readyOrNo: UILabel!
    
    @IBOutlet weak var progresBar: UIProgressView!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        readyOrNo.text = "How do you like your eggs?"
        timer.invalidate()
        progresBar.progress = 0
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        progresCount = 1.0 / Float(totalTime!)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer(){
        if totalTime! >= 0 {
            progresBar.progress += progresCount
            totalTime! -= 1
        }else{
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            readyOrNo.text = "Ready"
        }
    }
}
 
