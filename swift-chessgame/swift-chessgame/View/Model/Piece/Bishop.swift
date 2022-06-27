//
//  Bishop.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/20.
//

import Foundation

final class Bishop: MovablePiece {
    override var value: String {
        return color == .black ? "♝" : "♗"
    }
    
    override class var initialFile: [Int] {
        return [2,5]
    }
    
    init(color: Color, position: Position) {
        let possibleDirection: [Direction] = [.leftUp, .leftDown, .rightUp, .rightDown]
        super.init(color: color, score: 3, position: position, possibleDirection: possibleDirection)
    }
}
