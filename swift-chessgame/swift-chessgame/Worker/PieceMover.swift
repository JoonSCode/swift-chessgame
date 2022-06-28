//
//  PieceMover.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/29.
//

import Foundation

struct PieceMover {
    func getMovablePositions(board: [[Pieceable?]], piece: Pieceable, from: Position) -> [Position] {
        var movablePositions: [Position] = []
        for direction in piece.possibleDirections {
            let offset = direction.offset
            
            for i in 1...piece.movableCount {
                let newPosition = Position(rank: from.rank + offset.rank * i, file: from.file + offset.file * i)
                
                guard isInBoundary(position: newPosition), !isSameColorPieceExist(board: board, piece: piece, position: newPosition)  else { break }
                movablePositions.append(newPosition)
                
                if let existPiece = board[newPosition.rank][newPosition.file], existPiece.color != piece.color {
                    break
                }
            }
        }
        
        return movablePositions
    }
    
    private func isSameColorPieceExist(board: [[Pieceable?]], piece: Pieceable, position: Position) -> Bool {
        return board[position.rank][position.file]?.color == piece.color
    }
    
    private func isInBoundary(position: Position) -> Bool {
        let size = 8
        return 0..<size ~= position.rank && 0..<size ~= position.file
    }
}

