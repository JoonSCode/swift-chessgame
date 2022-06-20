//
//  ChessBoard.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/20.
//

import Foundation

final class ChessBoard {
    private var board: [[Character]] = []
    
    init() {
        refreshBoard()
    }
    
    func refreshBoard() {
        board = [[Character]](repeating: [Character](repeating: ".", count: 9), count: 10)
        board[0] = [" ", "A", "B", "C", "D", "E" ,"F", "G", "H"]
        board[9] = [" ", "A", "B", "C", "D", "E" ,"F", "G", "H"]

        for i in 1...8 {
            board[i][0] = Character(String(i))
        }

    }
    
    func display() -> [String] {
        return board.compactMap({
            String($0)
        })
    }
    
    func caculateScore() -> [Int] {
        return [0,0]
    }
    
    func moveUnit() -> Bool {
        var isCorrectMove: Bool = false
        
        return isCorrectMove
    }
}
