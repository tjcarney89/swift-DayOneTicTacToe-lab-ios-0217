//
//  ViewController.swift
//  TicTacToe
//
//  Created by Jim Campagno on 2/5/17.
//  Copyright © 2017 Jim Campagno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BoardDelegate {
    
    @IBOutlet weak var boardZero: Board!
    @IBOutlet weak var boardOne: Board!
    @IBOutlet weak var boardTwo: Board!
    
    @IBOutlet weak var boardThree: Board!
    @IBOutlet weak var boardFour: Board!
    @IBOutlet weak var boardFive: Board!
    
    @IBOutlet weak var boardSix: Board!
    @IBOutlet weak var boardSeven: Board!
    @IBOutlet weak var boardEight: Board!
    
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    var allBoards: [Board] {
        return [boardZero, boardOne, boardTwo, boardThree, boardFour, boardFive, boardSix, boardSeven, boardEight]
    }
    
    var game = [Int : [Player?]]()
    var bigGame = [Player?]()
    var winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
    var currentBoard: Board!
    var finalBoard: Board!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        rightLabel.isHidden = true
        leftLabel.isHidden = true
        
    
        bigGame = [nil, nil, nil, nil, nil, nil, nil, nil, nil]

        for i in 0..<9 {
            game[i] = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
        }
        
    }
    
    func initialSetup() {
        var boardPosition = 0
        for board in allBoards {
            board.position = boardPosition
            board.delegate = self
            boardPosition += 1
        }
    }

    

    func playerTurn(board: Board, position: Int) -> Player {
        currentBoard = board
//        print(board.position, position)
        
        var player1 = Player.x
        var player2 = Player.o
        
        if board.playerCheck == false {
            if var spaces = game[board.position] {
                spaces[position] = Player.x
                game[board.position] = spaces
//                print(spaces)
            }
            
            if let winner =  checkForWin() {
                board.winner = winner
                updateBigBoard()
                checkForUltimateWin()
            }


            return player1
        } else {
            if var spaces = game[board.position] {
                spaces[position] = Player.o
                game[board.position] = spaces
 //               print(spaces)
            }
           if let winner =  checkForWin() {
            board.winner = winner
            updateBigBoard()
            checkForUltimateWin()
            }

            return player2
            
        }
        
        
    }
    
    func checkForWin() -> Player? {
        var winner: Player?
        for combination in winningCombinations {
            let first = combination[0]
            let second = combination[1]
            let third = combination[2]
            
            let gameBoard = game[currentBoard.position]!
            
            guard let possibleWinner = gameBoard[first] else {
                continue
            }
            
            if gameBoard[first] == gameBoard[second] && gameBoard[first] == gameBoard[third] {
                winner = possibleWinner
                currentBoard.win(for: winner!)
                print("The winner is \(winner!)")
                break
            } else {
                winner = nil
            }
        }
        
        return winner
    }
    
    func updateBigBoard() -> Player? {
        var thereIsAWinner: Bool = false
        var winner: Player?
        if checkForWin() == Player.x {
            winner = Player.x
            thereIsAWinner = true
        } else if checkForWin() == Player.o {
            winner = Player.o
            thereIsAWinner = true
        }else {
            thereIsAWinner = false
        }
        if thereIsAWinner == true {
            bigGame[currentBoard.position] = winner
        }
        print(bigGame)
        return winner
    }
    
    func checkForUltimateWin() -> Player? {
        print("GOT CALLED!")
        var winner: Player?
        for combination in winningCombinations {
            let first = combination[0]
            let second = combination[1]
            let third = combination[2]
            
            let bigBoard = bigGame
            
            guard let potentialWinner = bigBoard[first] else {
                continue
            }
            
            if bigBoard[first] == bigBoard[second] && bigBoard[first] == bigBoard[third] {
                winner = potentialWinner
//                finalBoard.win(for: winner!)
                print("The big winner is \(winner!)")
                rightLabel.isHidden = false
                leftLabel.isHidden = false
                rightLabel.text = "\(winner!) wins!"
                leftLabel.text = "\(winner!) wins!"
                break
            } else {
                winner = nil
            }
            
        }
        print(bigGame)
        return winner
    }

        
        
    

    

    
    

    
    
}
