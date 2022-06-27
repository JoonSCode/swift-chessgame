//
//  Queen.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/20.
//

import Foundation

final class Queen: MovablePiece {
    override var value: String {
        return color == .black ? "♛" : "♕"
    }

    override class var initialFile: [Int] {
        return [4]
    }
    
    init(color: Color, position: Position) {
        let possibleDirection: [Direction] = [.leftDown, .leftUp, .rightUp, .rightDown, .down, .up, .left, .right]
        super.init(color: color, score: 9, position: position, possibleDirection: possibleDirection)
    }
}
