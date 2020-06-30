//
//  ViewController.swift
//  X-O
//
//  Created by moahammed on 6/29/20.
//  Copyright © 2020 Almousawi2002. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox


class ViewController: UIViewController {
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    
    @IBOutlet weak var turnLable: UILabel!
    
    @IBOutlet weak var XLable: UILabel!
    @IBOutlet weak var OLable: UILabel!
    
    
    var BackgroundSound: AVAudioPlayer?
    var FunnyX: AVAudioPlayer?
    var FunnyO: AVAudioPlayer?
    
    func playSound() {
        let path = Bundle.main.path(forResource: "Interstellar.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            BackgroundSound = try AVAudioPlayer(contentsOf: url)
            BackgroundSound?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    func playFunnyX() {
        let path = Bundle.main.path(forResource: "Funny-X.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            FunnyX = try AVAudioPlayer(contentsOf: url)
            FunnyX?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    func playFunnyO() {
        let path = Bundle.main.path(forResource: "Funny-O.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            FunnyO = try AVAudioPlayer(contentsOf: url)
            FunnyO?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    var counter = 0
    var BGCounter = 0
    var buttons: [UIButton] = []
    
    override func viewDidLoad() {
        buttons = [b1, b2, b3, b4, b5, b6, b7, b8, b9]
        playSound()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
    }
    
    
    
    @IBAction func press(_ sender: UIButton) {
        
        print("تم الضغط علي!")
        print(counter)
        if counter % 2 == 0 {
            playFunnyX()
            sender.setTitle("X", for: .normal)
            sender.setTitleColor(.green, for: .normal)
            turnLable.text = "O Turn"
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
        else {
            playFunnyO()
            sender.setTitle("O", for: .normal)
            sender.setTitleColor(.red, for: .normal)
            turnLable.text = "X Turn"
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
        counter += 1
        sender.isEnabled = false
        
        if Winning(winner: "X") {
            okAlert(title: "X Wins!", message: "مبرووووك X 😍")
        }
        else if Winning(winner: "O") {
            okAlert(title: "O Wins!", message: "مبرووووك O 😍")
        }
        else if counter == 9 {
            okAlert(title: "Draw!", message: "reset the game!")
        }
    }
    
    @IBAction func resetTapped() {
        restartGame()
        
        if (BGCounter == 0){
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-2")!)
            BGCounter += 1
        }else if (BGCounter == 1){
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-4")!)
            BGCounter += 1
        }else if (BGCounter == 2){
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-8")!)
            BGCounter += 1
        }else if (BGCounter == 3){
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-9")!)
            BGCounter += 1
        }else if (BGCounter == 4){
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-11")!)
            BGCounter += 1
        }else if (BGCounter == 5){
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-13")!)
            BGCounter += 1
        }else if (BGCounter == 6){
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-15")!)
            BGCounter += 1
        }else if (BGCounter == 7){
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-20")!)
            BGCounter += 1
        }else if (BGCounter == 8){
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-22")!)
            BGCounter += 1
        }else if (BGCounter == 9){
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-23")!)
            BGCounter += 1
        }else if (BGCounter == 10){
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
            BGCounter = 0
        }
        
    }
    
    
    func Winning(winner: String) -> Bool
    {
        
        if  (b1.titleLabel?.text == winner && b2.titleLabel?.text == winner && b3.titleLabel?.text == winner) ||
            (b4.titleLabel?.text == winner && b5.titleLabel?.text == winner && b6.titleLabel?.text == winner) ||
            (b7.titleLabel?.text == winner && b8.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
            (b1.titleLabel?.text == winner && b4.titleLabel?.text == winner && b7.titleLabel?.text == winner) ||
            (b2.titleLabel?.text == winner && b5.titleLabel?.text == winner && b8.titleLabel?.text == winner) ||
            (b3.titleLabel?.text == winner && b6.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
            (b1.titleLabel?.text == winner && b5.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
            (b3.titleLabel?.text == winner && b5.titleLabel?.text == winner && b7.titleLabel?.text == winner)
        {
            if winner == "X" {
                var score: Int = Int(XLable.text!)!
                score += 1
                XLable.text = "\(score)"
            } else if winner == "O" {
                var score: Int = Int(XLable.text!)!
                score += 1
                OLable.text = "\(score)"
            }
            
            
            
           
            
            print("\(winner) الفائز")
            
            let alertController = UIAlertController(title: "\(winner) فاز", message: "قم بالضغط على الزر التالي كي يتم إعادة اللعب", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "إعادة اللعب", style: .cancel) { (alert) in
                self.restartGame()
            }
            alertController.addAction(restartAction)
            present(alertController, animated: true, completion: nil)
            
            if (BGCounter == 0){
                       self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-2")!)
                       BGCounter += 1
                   }else if (BGCounter == 1){
                       self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-4")!)
                       BGCounter += 1
                   }else if (BGCounter == 2){
                       self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-8")!)
                       BGCounter += 1
                   }else if (BGCounter == 3){
                       self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-9")!)
                       BGCounter += 1
                   }else if (BGCounter == 4){
                       self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-11")!)
                       BGCounter += 1
                   }else if (BGCounter == 5){
                       self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-13")!)
                       BGCounter += 1
                   }else if (BGCounter == 6){
                       self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-15")!)
                       BGCounter += 1
                   }else if (BGCounter == 7){
                       self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-20")!)
                       BGCounter += 1
                   }else if (BGCounter == 8){
                       self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-22")!)
                       BGCounter += 1
                   }else if (BGCounter == 9){
                       self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-23")!)
                       BGCounter += 1
                   }else if (BGCounter == 10){
                       self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
                       BGCounter = 0
                   }
        }
        if  (b1.titleLabel?.text == winner && b2.titleLabel?.text == winner && b3.titleLabel?.text == winner) ||
            (b4.titleLabel?.text == winner && b5.titleLabel?.text == winner && b6.titleLabel?.text == winner) ||
            (b7.titleLabel?.text == winner && b8.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
            (b1.titleLabel?.text == winner && b4.titleLabel?.text == winner && b7.titleLabel?.text == winner) ||
            (b2.titleLabel?.text == winner && b5.titleLabel?.text == winner && b8.titleLabel?.text == winner) ||
            (b3.titleLabel?.text == winner && b6.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
            (b1.titleLabel?.text == winner && b5.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
            (b3.titleLabel?.text == winner && b5.titleLabel?.text == winner && b7.titleLabel?.text == winner)
        {
            return true
        }
        else {
            return false
        }
    }
    
    
    func restartGame()
    {
        
        for b in buttons {
            b.setTitle("", for: .normal)
            b.titleLabel?.text = ""
            b.isEnabled = true
        }
        
        counter = 0
        turnLable.text = "X Turn"
    }
    
    func okAlert(title: String, message: String)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let restartAction = UIAlertAction(title: "إعادة اللعب", style: .cancel) { (alert) in
            self.restartGame()
        }
        alertController.addAction(restartAction)
        present(alertController, animated: true, completion: nil)
        
        if (BGCounter == 0){
                   self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-2")!)
                   BGCounter += 1
               }else if (BGCounter == 1){
                   self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-4")!)
                   BGCounter += 1
               }else if (BGCounter == 2){
                   self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-8")!)
                   BGCounter += 1
               }else if (BGCounter == 3){
                   self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-9")!)
                   BGCounter += 1
               }else if (BGCounter == 4){
                   self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-11")!)
                   BGCounter += 1
               }else if (BGCounter == 5){
                   self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-13")!)
                   BGCounter += 1
               }else if (BGCounter == 6){
                   self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-15")!)
                   BGCounter += 1
               }else if (BGCounter == 7){
                   self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-20")!)
                   BGCounter += 1
               }else if (BGCounter == 8){
                   self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-22")!)
                   BGCounter += 1
               }else if (BGCounter == 9){
                   self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-23")!)
                   BGCounter += 1
               }else if (BGCounter == 10){
                   self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
                   BGCounter = 0
               }
    }
    
}


