//
//  ChessBoard.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/20.
//

import Foundation

final class ChessBoard {
    private var board: [[String]] = []
    private var turn: Color = .white
    
    init() {
        refreshBoard()
    }
    
    func refreshBoard() {
        board = [[String]](repeating: [String](repeating: ".", count: 8), count: 8)
        board[0] = [Luke(color: .black).value, Knight(color: .black).value, Bishop(color: .black).value, ".", Queen(color: .black).value, Bishop(color: .black).value, Knight(color: .black).value, Luke(color: .black).value]
        board[1] = [String](repeating: Pawn(color: .black).value, count: 8)
        
        board[6] = [String](repeating: Pawn(color: .white).value, count: 8)
        board[7] = [Luke(color: .white).value, Knight(color: .white).value, Bishop(color: .white).value, ".", Queen(color: .white).value, Bishop(color: .white).value, Knight(color: .white).value, Luke(color: .white).value]
    }
    
    func display() -> [String] {
        var displayBoard: [String] = []
        displayBoard.append(" ABCDEFGH")
        for i in 1...8 {
            displayBoard.append("\(i)\(board[i-1].joined())")
        }
        displayBoard.append(" ABCDEFGH")
        return displayBoard
    }
    
    func caculateScore() -> [Int] {
        return [0,0]
    }
    
    func moveUnit() -> Bool {
        var isCorrectMove: Bool = false
        
        return isCorrectMove
    }
}
