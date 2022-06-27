//
//  Knight.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/20.
//

import Foundation

final class Knight: MovablePiece {
    override var value: String {
        return color == .black ? "♞" : "♘"
    }
    
    override class var initialFile: [Int] {
        return [1,6]
    }
    
    init(color: Color, position: Position) {
        var possibleDirection: [Direction] = []
        if color == .black {
            possibleDirection.append(.down)
        } else {
            possibleDirection.append(.up)
        }
        super.init(color: color, score: 3, position: position, possibleDirection: possibleDirection)
    }
    
}
