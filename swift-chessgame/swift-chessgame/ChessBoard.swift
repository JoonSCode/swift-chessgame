//
//  ChessBoard.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/20.
//

import Foundation

final class ChessBoard {
    private var board: [[Piece]] = []
    private var turn: Color = .white
    
    init() {
        refreshBoard()
    }
    
    // MARK: Init
    
    func refreshBoard() {
        initBoard()
        initPiece(color: .black)
        initPiece(color: .white)
    }
    
    private func initBoard() {
        board = [[Piece]](repeating: [Piece](repeating: EmptyPiece(), count: 8), count: 8)
    }
    
    private func initPiece(color: Color) {
        for position in Luke.getInitialPositions(color: color) {
            board[position.rank][position.file] = Luke(color: color, position: position)
        }
        
        for position in Knight.getInitialPositions(color: color) {
            board[position.rank][position.file] = Knight(color: color, position: position)
        }
        
        for position in Bishop.getInitialPositions(color: color) {
            board[position.rank][position.file] = Bishop(color: color, position: position)
        }
        
        for position in Queen.getInitialPositions(color: color) {
            board[position.rank][position.file] = Queen(color: color, position: position)
        }
        
        for position in Pawn.getInitialPositions(color: color) {
            board[position.rank][position.file] = Pawn(color: color, position: position)
        }
    }

    func setBoard(board: [[Piece]]) {
        self.board = board
    }
    
    // MARK: Display
    
    func display() -> [String] {
        var displayBoard: [String] = []
        displayBoard.append(" ABCDEFGH")
        for i in 1...8 {
            let rowString = board[i-1].map({
                $0.value
            }).joined()
            
            displayBoard.append("\(i)\(rowString)")
        }
        displayBoard.append(" ABCDEFGH")
        return displayBoard
    }
    
    // MARK: Score
    
    func caculateScore() -> [Int] {
        return [getScore(color: .black), getScore(color: .white)]
    }
    
    private func getScore(color: Color) -> Int {
        var count = 0
        
        board.forEach({ row in
            let colorFilteredRow = row.filter({
                $0.color == color
            })
            count += colorFilteredRow.reduce(0) { $0 + $1.score }
        })
        
        return count
    }
    
    // MARK: MoveUnit
    
    func moveUnit() -> Bool {
        var isCorrectMove: Bool = false
        
        return isCorrectMove
    }
    
    func getMovablePlace(piece: Piece) -> [String] {
        return []
    }
}
