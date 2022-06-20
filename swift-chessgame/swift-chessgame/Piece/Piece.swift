//
//  Piece.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/20.
//

import Foundation

class Piece {
    let color: Color
    let score: Int
    var value: String {
        return ""
    }
    let move: PieceMove
    
    init(color: Color, score: Int, move: PieceMove) {
        self.color = color
        self.score = score
        self.move = move
    }
}

enum PieceMove {
    case diagonal
    case straight
}
