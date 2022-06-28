//
//  Movable.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/23.
//

import Foundation

struct Position: Hashable {
    let rank: Int
    let file: Int
}

enum Direction {
    case left
    case right
    case up
    case down
    
    case leftUp
    case leftDown
    case rightUp
    case rightDown
    
    var offset: Position {
        switch self {
        case .left:
            return Position(rank: 0, file: -1)
        case .right:
            return Position(rank: 0, file: 1)
        case .up:
            return Position(rank: -1, file: 0)
        case .down:
            return Position(rank: 1, file: 0)
        case .leftUp:
            return Position(rank: -1, file: -1)
        case .leftDown:
            return Position(rank: 1, file: -1)
        case .rightUp:
            return Position(rank: -1, file: 1)
        case .rightDown:
            return Position(rank: 1, file: 1)
        }
    }
}
