//
//  ViewController.swift
//  TTT Ahad
//
//  Created by admin on 09/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    enum Player {
            case Blue
            case Red
        }
    

    @IBOutlet weak var TTTLabel: UILabel!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var restartBtn: UIButton!
    
    
    var firstPlayer = Player.Blue
    var currentPlayer = Player.Blue
        
    var BLUE = UIColor.blue
    var RED = UIColor.red
    var board = [UIButton]()
        

    @IBAction func actionsColor(_ sender: UIButton) {
        theTurn(sender)
        if checkForVictory(BLUE)
                {
            winnerLabel.text = "Blue Is Winner!"
            winnerLabel.textColor = UIColor.blue
                }
                
        if checkForVictory(RED)
                {
            winnerLabel.text = "Red Is Winner!"
            winnerLabel.textColor = UIColor.red
                }
        
        if fullBoard() {
            resetBoard()
        }
    }
    
    @IBAction func restartBtn(_ sender: UIButton) {
        resetBoard()
        winnerLabel.text = "Who Is Winner?"
        winnerLabel.textColor = UIColor.black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initBoard()
        winnerLabel.text = "Who Is Winner?"
    }
    
    func theTurn(_ sender: UIButton) {
            if (sender.backgroundColor == nil) {
                if (currentPlayer == Player.Blue) {
                    sender.backgroundColor = BLUE
                    currentPlayer = Player.Red
                }
                else if (currentPlayer == Player.Red) {
                    sender.backgroundColor = RED
                    currentPlayer = Player.Blue
                }
                sender.isEnabled = false
            }
        }
    
    func resetBoard() {
            for i in board {
                i.backgroundColor = nil
                i.isEnabled = true
            }
            if firstPlayer == Player.Blue {
                firstPlayer = Player.Red
            }
            else if firstPlayer == Player.Red {
                firstPlayer = Player.Blue
            }
            currentPlayer = firstPlayer
        }

    func initBoard() {
            board.append(btn1)
            board.append(btn2)
            board.append(btn3)
            board.append(btn4)
            board.append(btn5)
            board.append(btn6)
            board.append(btn7)
            board.append(btn8)
            board.append(btn9)
        }
        
        func fullBoard() -> Bool {
            for i in board {
                if i.backgroundColor == nil {
                    return false
                }
            }
            return true
        }
    func disabledBtn() {
        for button in board{
                  button.isEnabled = false
              }
    }
    func checkForVictory(_ teamColor : UIColor) -> Bool
        {
            // Horizontal Victory
            if thisSymbol(btn1, teamColor) && thisSymbol(btn2, teamColor) && thisSymbol(btn3, teamColor)
            {
                disabledBtn()
                return true
            }
            if thisSymbol(btn4, teamColor) && thisSymbol(btn5, teamColor) && thisSymbol(btn6, teamColor)
            {
                disabledBtn()
                return true
            }
            if thisSymbol(btn7, teamColor) && thisSymbol(btn8, teamColor) && thisSymbol(btn9, teamColor)
            {
                disabledBtn()
                return true
            }
            
            // Vertical Victory
            if thisSymbol(btn1, teamColor) && thisSymbol(btn4, teamColor) && thisSymbol(btn7, teamColor)
            {
                disabledBtn()
                return true
            }
            if thisSymbol(btn2, teamColor) && thisSymbol(btn5, teamColor) && thisSymbol(btn8, teamColor)
            {
                disabledBtn()
                return true
            }
            if thisSymbol(btn3, teamColor) && thisSymbol(btn6, teamColor) && thisSymbol(btn9, teamColor)
            {
                disabledBtn()
                return true
            }
            
            // Diagonal Victory
            if thisSymbol(btn1, teamColor) && thisSymbol(btn5, teamColor) && thisSymbol(btn9, teamColor)
            {
                disabledBtn()
                return true
            }
            if thisSymbol(btn3, teamColor) && thisSymbol(btn5, teamColor) && thisSymbol(btn7, teamColor)
            {
                disabledBtn()
                return true
            }
            
            return false
        }
        
    func thisSymbol(_ button: UIButton, _ color: UIColor) -> Bool
        {
            return button.backgroundColor == color
        }



}

