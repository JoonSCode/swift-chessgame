//
//  Luke.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/20.
//

import Foundation

final class Luke: MovablePiece {
    override var value: String {
        return color == .black ? "♜" : "♖"
    }

    override class var initialFile: [Int] {
        return [0,7]
    }
    
    init(color: Color, position: Position) {
        let possibleDirection: [Direction] = [.left, .right, .up, .down]
        super.init(color: color, score: 5, position: position, possibleDirection: possibleDirection)
    }
}
