//
//  Movable.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/23.
//

import Foundation

protocol Movable {
    var position: Position { get }
    var possibleDirection: [Direction] { get }
    var maxRank: Int { get }
    var maxFile: Int { get }
    var movableCount: Int { get }
}

extension Movable {
    func getMovablePositions() -> [Position] {
        var movablePositions: [Position] = []
        for direction in possibleDirection {
            let offset = direction.offset
            
            for i in 1...movableCount {
                let newPosition = Position(rank: position.rank + offset.rank * i, file: position.file + offset.file * i)
                
                guard isInBoundary(position: newPosition) else { break }
                movablePositions.append(newPosition)
            }
        }
        
        return movablePositions
    }
    
    func isInBoundary(position: Position) -> Bool {
        return 0..<maxRank ~= position.rank && 0..<maxFile ~= position.file
    }
}

struct Position {
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
            return Position(rank: -1, file: 0)
        case .right:
            return Position(rank: 1, file: 0)
        case .up:
            return Position(rank: 0, file: -1)
        case .down:
            return Position(rank: 0, file: 1)
        case .leftUp:
            return Position(rank: -1, file: -1)
        case .leftDown:
            return Position(rank: -1, file: 1)
        case .rightUp:
            return Position(rank: 1, file: -1)
        case .rightDown:
            return Position(rank: 1, file: 1)
        }
    }
}
