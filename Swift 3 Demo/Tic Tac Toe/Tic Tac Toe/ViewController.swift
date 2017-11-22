//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Sergio Díaz Navarro on 12/12/16.
//  Copyright © 2016 Sergio Díaz Navarro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activeGame = true
    var iCont = 0
    var activePlayer = 1 //1 for noughts, 2 for crosses
    var gameState = [0,0,0,0,0,0,0,0,0] //0 empty, 1 noughts, 2 crosses
    var activePosition = 0
    var moveCounter = 0
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var isTied = false
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    @IBAction func playAgain(_ sender: Any) {
        
        //reset Variables
        activeGame = true
        gameState = [0,0,0,0,0,0,0,0,0] //0 empty, 1 noughts, 2 crosses
        activePlayer = 1 //1 for noughts, 2 for crosses
        moveCounter = 0

        
        
        for i in 1..<10{
           
            if let button = view.viewWithTag(i) as? UIButton{
                button.setImage(nil, for: [])
            }
        }
        
        winnerLabel.isHidden = true
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        
        playAgainButton.isHidden = true
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)


    }
    
    
    func hiddenLabels(){
        
        UIView.animate(withDuration:1, animations:{
            
            self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
            self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
            
        })

    }
    
    func gameResult(){
        activeGame = false
        winnerLabel.isHidden = false
        playAgainButton.isHidden = false
        isTied = false


    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
       
        activePosition = sender.tag - 1
        
        if ((gameState[activePosition] == 0 && activeGame)){
            
            gameState[activePosition] = activePlayer
            
            if activePlayer == 1{
                sender.setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2
            } else{
                sender.setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
            }
            
            
            for combination in winningCombinations{
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{

                    //We have a winner

                    gameResult()
                    hiddenLabels()
                    
                    if gameState[combination[0]] == 1{
                        
                        winnerLabel.text = "Noughts has won!"
                    } else{
                        
                        winnerLabel.text = "Crosses has won!"

                    }
                    
                }
                
            }
            
            moveCounter += 1
            print(moveCounter)
            if moveCounter >= 9 && activeGame {
                gameResult()
                hiddenLabels()
                winnerLabel.text = "TIE!"
                print("is a tie IF")

                
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        winnerLabel.isHidden = true
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)

        playAgainButton.isHidden = true
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

