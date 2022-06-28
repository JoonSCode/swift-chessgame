//
//  ChessBoard.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/20.
//

import Foundation
import Combine

final class ChessBoard {
    @Published private(set) var board: [[Pieceable?]] = []
    private(set) var turn: Color = .white
    
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
        board = [[Pieceable?]](repeating: [Pieceable?](repeating: nil, count: 8), count: 8)
    }
    
    private func initPiece(color: Color) {
        let pieceTypes: [Pieceable.Type] = [Pawn.self, Rook.self, Knight.self, Bishop.self, Queen.self]
        pieceTypes.forEach({ pieceType in
            let initialPositions = pieceType.initialPositions(color: color)
            
            for position in initialPositions {
                board[position.rank][position.file] = pieceType.init(color: color)
            }
        })
    }

    func setBoard(board: [[Pieceable]]) {
        self.board = board
    }
    
    // MARK: Display
    
    func display() -> [String] {
        var displayBoard: [String] = []
        displayBoard.append(" ABCDEFGH")
        for i in 1...8 {
            let rowString = board[i-1].map({
                guard let piece = $0 else { return "."}
                return piece.shape
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
            row.forEach({
                guard let piecable = $0, piecable.color == color else { return }
                count += piecable.score
            })
        })
        
        return count
    }
    
    // MARK: MoveUnit
    
    func moveUnit() -> Bool {
        var isCorrectMove: Bool = false
        
        return isCorrectMove
    }
    
    func getMovablePositions(piece: Pieceable) -> [Position] {
//        let movablePosition = piece.getMovablePositions().filter({
//            (board[$0.rank][$0.file] as? MovablePiece)?.color == piece.color
//        })
//        return movablePosition
        return []
    }
}
