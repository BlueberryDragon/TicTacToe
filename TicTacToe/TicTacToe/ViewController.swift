//
//  ViewController.swift
//  TicTacToe
//
//  Created by Casey Lovell on 5/7/15.
//  Copyright (c) 2015 Blueberry Dragon Studios. All rights reserved.
//

import UIKit

//true = O; false = X
var xOrO = true
var b1a = String()
var b1b = String()
var b1c = String()
var b2a = String()
var b2b = String()
var b2c = String()
var b3a = String()
var b3b = String()
var b3c = String()

var flag1a = true
var flag1b = true
var flag1c = true
var flag2a = true
var flag2b = true
var flag2c = true
var flag3a = true
var flag3b = true
var flag3c = true

var counter = 1
var timer = NSTimer()
var bananaWin = true

class ViewController: UIViewController {

    let imageClickedO = UIImage(named: "Banana1.png") as UIImage!
    let imageClickedX = UIImage(named: "Orange1.png") as UIImage!
    let imageClickedBlank = UIImage(named:"" ) as UIImage!
    //let myRedColor = UIColor(red: 0.831, green: 0.168, blue: 0.141, alpha: 1.0)
    //let myBlueColor = UIColor(red: 0.250, green: 0.325, blue: 0.733, alpha: 1.0)
    
    @IBOutlet weak var labelResult: UILabel!
    
   
    @IBOutlet weak var button1aImage: UIButton!
    @IBOutlet weak var button1bImage: UIButton!
    @IBOutlet weak var button1cImage: UIButton!
    @IBOutlet weak var button2aImage: UIButton!
    @IBOutlet weak var button2bImage: UIButton!
    @IBOutlet weak var button2cImage: UIButton!
    @IBOutlet weak var button3aImage: UIButton!
    @IBOutlet weak var button3bImage: UIButton!
    @IBOutlet weak var button3cImage: UIButton!
    
    @IBOutlet weak var dancingBanana: UIImageView!
    @IBOutlet weak var dancingOrange: UIImageView!
    
    
    @IBOutlet weak var bananaConst: NSLayoutConstraint!
    @IBOutlet weak var OrangeConst: NSLayoutConstraint!

    
    func bananaAni() {
    
        if counter >= 8 {
            
            counter = 1
            
        } else {
            
            counter++
            
        }
        
        dancingBanana.image = UIImage(named: "banana" + String(counter))
    
    
    }
    func orangeAni() {
        
        if counter >= 2 {
            
            counter = 1
            
        } else {
            
            counter++
            
        }
        
        dancingOrange.image = UIImage(named: "orange" + String(counter))
        
        
    }
    
    func flagTurn() {
        
        if xOrO == true {
            
            
            xOrO = false
            
        } else {
            
            xOrO = true
            
        }
        
    }
    
    func lockGame() {
    
        flag1a = false
        flag1b = false
        flag1c = false
        flag2a = false
        flag2b = false
        flag2c = false
        flag3a = false
        flag3b = false
        flag3c = false
    
    }
    
    func errorPicked() {
    
        
    }
    
    
    func oWinner() {
    
        
        
        labelResult.text = "Banana Wins!"
        
        lockGame()
        
        
        var newConst = NSLayoutConstraint(item: dancingBanana, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .Leading, multiplier: 1.0, constant: 0)
        
        
        UIView.animateWithDuration(4, animations: { () -> Void in
            self.view.removeConstraint(self.bananaConst)
            self.view.addConstraint(newConst)
            self.view.layoutIfNeeded()
            
            }, completion: {
                (value: Bool) in

                timer.invalidate()
                self.dancingBanana.image = UIImage(named: "banana1")
                
            })
        
        bananaConst = newConst
        bananaWin = true
        
         timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "bananaAni", userInfo: nil, repeats: true)
        


    }
    
    func xWinner() {
        
        labelResult.text = "Orange Wins!"
        
         lockGame()
        
        var newConst2 = NSLayoutConstraint(item: dancingOrange, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .Leading, multiplier: 1.0, constant: 290)
        
        
        UIView.animateWithDuration(4, animations: { () -> Void in
            self.view.removeConstraint(self.OrangeConst)
            self.view.addConstraint(newConst2)
            self.view.layoutIfNeeded()}, completion: {
                (value: Bool) in
                
                timer.invalidate()
                self.dancingOrange.image = UIImage(named: "orange1")
                
        })

        OrangeConst = newConst2
        bananaWin = false
        
         timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "orangeAni", userInfo: nil, repeats: true)
        
    }
    
    func checkWinnerO() {
        
        if b1a ==  "o" && b1b == "o" && b1c == "o" {
        
            oWinner()
            
        } else {
        
            if b2a ==  "o" && b2b == "o" && b2c == "o" {
            
            oWinner()
            
            } else {
            
                if b3a ==  "o" && b3b == "o" && b3c == "o" {
                
                oWinner()
                
                } else {
                
                    if b1a ==  "o" && b2a == "o" && b3a == "o" {
                    
                    oWinner()
                    
                    } else {
                    
                        if b1b ==  "o" && b2b == "o" && b3b == "o" {
                        
                        oWinner()
                        
                        } else {
                        
                            if b1c ==  "o" && b2c == "o" && b3c == "o" {
                            
                            oWinner()
                                
                            } else {
                            
                                if b1a ==  "o" && b2b == "o" && b3c == "o" {
                                
                                oWinner()
                                
                                } else {
                                
                                    if b1c ==  "o" && b2b == "o" && b3a == "o" {
                                    
                                    oWinner()
                                    
                                    }
                                
                                }
                            
                            }
                        
                        }
                    
                    }
                
                }
            
            }
        
        }
    
    
    }
    
    func checkWinnerX() {
        
        if b1a ==  "x" && b1b == "x" && b1c == "x" {
            
            xWinner()
            
        } else {
            
            if b2a ==  "x" && b2b == "x" && b2c == "x" {
                
                xWinner()
                
            } else {
                
                if b3a ==  "x" && b3b == "x" && b3c == "x" {
                    
                    xWinner()
                    
                } else {
                    
                    if b1a ==  "x" && b2a == "x" && b3a == "x" {
                        
                        xWinner()
                        
                    } else {
                        
                        if b1b ==  "x" && b2b == "x" && b3b == "x" {
                            
                            xWinner()
                            
                        } else {
                            
                            if b1c ==  "x" && b2c == "x" && b3c == "x" {
                                
                                xWinner()
                                
                            } else {
                                
                                if b1a ==  "x" && b2b == "x" && b3c == "x" {
                                    
                                    xWinner()
                                    
                                } else {
                                    
                                    if b1c ==  "x" && b2b == "x" && b3a == "x" {
                                        
                                        xWinner()
                                        
                                    }
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
        
    }
    
    @IBAction func buttonReset(sender: AnyObject) {
        
        button1aImage.setImage(imageClickedBlank, forState: UIControlState.Normal)
        button1bImage.setImage(imageClickedBlank, forState: UIControlState.Normal)
        button1cImage.setImage(imageClickedBlank, forState: UIControlState.Normal)
        button2aImage.setImage(imageClickedBlank, forState: UIControlState.Normal)
        button2bImage.setImage(imageClickedBlank, forState: UIControlState.Normal)
        button2cImage.setImage(imageClickedBlank, forState: UIControlState.Normal)
        button3aImage.setImage(imageClickedBlank, forState: UIControlState.Normal)
        button3bImage.setImage(imageClickedBlank, forState: UIControlState.Normal)
        button3cImage.setImage(imageClickedBlank, forState: UIControlState.Normal)
        

        b1a = String()
        b1b = String()
        b1c = String()
        b2a = String()
        b2b = String()
        b2c = String()
        b3a = String()
        b3b = String()
        b3c = String()
        
        flag1a = true
        flag1b = true
        flag1c = true
        flag2a = true
        flag2b = true
        flag2c = true
        flag3a = true
        flag3b = true
        flag3c = true
        
        labelResult.text = "Ready! Set! TicTacToe, Motherfuckers!"

         /*  var newConst = NSLayoutConstraint(item: dancingBanana, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .Leading, multiplier: 1.0, constant: 400)
        
            UIView.animateWithDuration(4, animations: { () -> Void in
            self.view.removeConstraint(self.bananaConst)
            self.view.addConstraint(newConst)
            self.view.layoutIfNeeded()
        
            })
        
            bananaConst = newConst
        */
        
    }
    
    
    @IBAction func button1A(sender: AnyObject) {
    
        
        if flag1a == true {

        
            if xOrO == true {
            
                button1aImage.setImage(imageClickedO, forState: UIControlState.Normal)
                
                flagTurn()
                
                flag1a = false
                
                b1a = "o"
                
                checkWinnerO()
                
                } else {
            
                    button1aImage.setImage(imageClickedX, forState: UIControlState.Normal)
                
                    flagTurn()
                
                    flag1a = false
                
                    b1a = "x"
                
                    checkWinnerX()
            }
        
        
            
        } else {
            
            errorPicked()
        
        }
    
    }
    
    
    @IBAction func button1B(sender: AnyObject) {
        
        if flag1b == true {
            
            if xOrO == true {
                
                button1bImage.setImage(imageClickedO, forState: UIControlState.Normal)
                
                flagTurn()
                
                flag1b = false
                
                b1b = "o"
                
                checkWinnerO()
                
            } else {
                
                button1bImage.setImage(imageClickedX, forState: UIControlState.Normal)
                
                flagTurn()
                
                flag1b = false
                
                b1b = "x"
                
                checkWinnerX()
            }
            
            
            
        } else {
            
            errorPicked()
            
        }
        
    }
    
    
    @IBAction func button1C(sender: AnyObject) {
        if flag1c == true {
            
            if xOrO == true {
                
                button1cImage.setImage(imageClickedO, forState: UIControlState.Normal)
                
                flagTurn()
                
                flag1c = false
                
                b1c = "o"
                
                checkWinnerO()
                
            } else {
                
                button1cImage.setImage(imageClickedX, forState: UIControlState.Normal)
                
                flagTurn()
                
                flag1c = false
                
                b1c = "x"
                
                checkWinnerX()
                
            }
            
            
            
        } else {
            
            errorPicked()
            
        }
        
        
    }
    
    
    @IBAction func button2A(sender: AnyObject) {
        
        if flag2a == true {
            
            if xOrO == true {
                
                button2aImage.setImage(imageClickedO, forState: UIControlState.Normal)
                
                flagTurn()
                
                flag2a = false
                
                b2a = "o"
                
                checkWinnerO()
                
            } else {
                
                button2aImage.setImage(imageClickedX, forState: UIControlState.Normal)
                
                flagTurn()
                
                flag2a = false
                
                b2a = "x"
                
                checkWinnerX()
                
            }
            
            
            
        } else {
            
            errorPicked()
            
        }
    }
    
    
    @IBAction func button2B(sender: AnyObject) {
        
        if flag2b == true {
            
            if xOrO == true {
                
                button2bImage.setImage(imageClickedO, forState: UIControlState.Normal)
                
                flagTurn()
                
                flag2b = false
                
                b2b = "o"
                
                checkWinnerO()
                
            } else {
                
                button2bImage.setImage(imageClickedX, forState: UIControlState.Normal)
                
                flagTurn()
                
                flag2b = false
                
                b2b = "x"
                
                checkWinnerX()
                
            }
            
        } else {
            
            errorPicked()
            
        }
        
    }
    
    
    @IBAction func button2C(sender: AnyObject) {
        
        if flag2c == true {
            
            if xOrO == true {
                
                button2cImage.setImage(imageClickedO, forState: UIControlState.Normal)
                
                flagTurn()
                
                flag2c = false
                
                b2c = "o"
                
                checkWinnerO()
                
            } else {
                
                button2cImage.setImage(imageClickedX, forState: UIControlState.Normal)
                
                flagTurn()
                
                flag2c = false
                
                b2c = "x"
                
                checkWinnerX()
                
            }
            
        } else {
            
            errorPicked()
            
        }
        
    }
    
    
    @IBAction func button3A(sender: AnyObject) {
        
        if flag3a == true {
            
            if xOrO == true {
                
                button3aImage.setImage(imageClickedO, forState: UIControlState.Normal)
                
                flagTurn()
                
                flag3a = false
                
                b3a = "o"
                
                checkWinnerO()
                
            } else {
                
                button3aImage.setImage(imageClickedX, forState: UIControlState.Normal)
                
                flagTurn()
                
                flag3a = false
                
                b3a = "x"
                
                checkWinnerX()
                
            }
            
        } else {
            
            errorPicked()
            
        }
        
    }
    
    
    @IBAction func button3B(sender: AnyObject) {
        
        if flag3b == true {
            
            if xOrO == true {
                
                button3bImage.setImage(imageClickedO, forState: UIControlState.Normal)
                
                flagTurn()
                
                flag3b = false
                
                b3b = "o"
                
                checkWinnerO()
                
            } else {
                
                button3bImage.setImage(imageClickedX, forState: UIControlState.Normal)
                
                flagTurn()
                
                flag3b = false
                
                b3b = "x"
                
                checkWinnerX()
                
            }
            
        } else {
            
            errorPicked()
            
        }
        
    }
    
    
    @IBAction func button3C(sender: AnyObject) {
        
        if flag3c == true {
            
            if xOrO == true {
                
                button3cImage.setImage(imageClickedO, forState: UIControlState.Normal)
                
                flagTurn()
                
                flag3c = false
                
                b3c = "o"
                
                checkWinnerO()
                
            } else {
                
                button3cImage.setImage(imageClickedX, forState: UIControlState.Normal)
                
                flagTurn()
                
                flag3c = false
                
                b3c = "x"
                
                checkWinnerX()
                
            }
            
        } else {
            
            errorPicked()
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


  override func viewDidLayoutSubviews() {
        
   
    var newConst = NSLayoutConstraint(item: dancingBanana, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .Leading, multiplier: 1.0, constant: 400)
    
    var newConst2 = NSLayoutConstraint(item: dancingOrange, attribute: .Trailing, relatedBy: .Equal, toItem: self.view, attribute: .Trailing, multiplier: 1.0, constant: -400)
    
    UIView.animateWithDuration(0, animations: { () -> Void in
        
        self.view.addConstraint(newConst)
        self.view.layoutIfNeeded()
        
        
    })
    
    UIView.animateWithDuration(0, animations: { () -> Void in
        
        self.view.addConstraint(newConst2)
        self.view.layoutIfNeeded()
        
        
    })
    
    bananaConst = newConst
    OrangeConst = newConst2
    
    
    
    }
    
    
    
   /* override func viewDidAppear(animated: Bool) {
        
    var newConst = NSLayoutConstraint(item: dancingBanana, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .Leading, multiplier: 1.0, constant: 400)
        
    var newConst2 = NSLayoutConstraint(item: dancingOrange, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .Leading, multiplier: 1.0, constant: -400)
    
    UIView.animateWithDuration(-20, animations: { () -> Void in
    self.view.removeConstraint(self.bananaConst)
    self.view.addConstraint(newConst)
    self.view.layoutIfNeeded()
    
        
        })
        
    UIView.animateWithDuration(-20, animations: { () -> Void in
    self.view.removeConstraint(self.OrangeConst)
    self.view.addConstraint(newConst2)
    self.view.layoutIfNeeded()
            
            
        })
      
    bananaConst = newConst
    OrangeConst = newConst2
        
    } */

}

