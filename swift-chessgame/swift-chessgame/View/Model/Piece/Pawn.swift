//
//  Pawn.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/20.
//

import Foundation

final class Pawn: MovablePiece {
    override var value: String {
        return color == .black ? "♟" : "♙"
    }
    
    override class var initialFile: [Int] {
        return [Int](0...7)
    }
    
    override class func initialRank(color: Color) -> Int {
        switch color {
        case .black:
            return 1
        case .white:
            return 6
        }
    }
    
    init(color: Color, position: Position) {
        var possibleDirection: [Direction] = []
        if color == .black {
            possibleDirection.append(.down)
        } else {
            possibleDirection.append(.up)
        }
        
        super.init(color: color, score: 1, position: position, possibleDirection: possibleDirection, movableCount: 1)
    }
}
