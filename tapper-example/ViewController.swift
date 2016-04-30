//
//  ViewController.swift
//  tapper-example
//
//  Created by Vinodh Srinivasan on 4/29/16.
//  Copyright © 2016 creaTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var maxTaps = 0
    var currTapCount = 0

    @IBOutlet weak var logoImg : UIImageView!
    @IBOutlet weak var playBtn : UIButton!
    @IBOutlet weak var coinBtn : UIButton!
    @IBOutlet weak var totalTapsLbl : UILabel!
    @IBOutlet weak var howManyTapsInput: UITextField!
    
    @IBAction func onPlayButton(sender: UIButton) {
        
        if(howManyTapsInput.text != nil && howManyTapsInput.text != "") {
            updateHideStatus(false)
            
            maxTaps = Int(howManyTapsInput.text!)!
            currTapCount = 0
            updateLabelWithCount()
        }
    }
    
    @IBAction func onTapButton(sender: UIButton) {
        currTapCount+=1
        
        if(isGameOver()){
            restartGame()
        }else {
            updateLabelWithCount()
        }
    }
    
    func restartGame() {
        howManyTapsInput.text = ""
        maxTaps = 0
        updateHideStatus(true)
    }
    
    func isGameOver() -> Bool {
        return currTapCount >= maxTaps
    }
    
    func updateLabelWithCount() {
        totalTapsLbl.text = "\(currTapCount) Taps"
    }
    
    func updateHideStatus(restart : Bool) {
        logoImg.hidden = !restart
        playBtn.hidden = !restart
        howManyTapsInput.hidden = !restart
        
        coinBtn.hidden = restart
        totalTapsLbl.hidden = restart
    }
    

}

