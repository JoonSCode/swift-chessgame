//
//  Pawn.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/20.
//

import Foundation

struct Pawn: Pieceable {
    var color: Color
    let score: Int = 1
    var shape: String {
        return color == .black ? "♟" : "♙"
    }
    
    let movableCount: Int = 1
    let possibleDirections: [Direction]
    // MARK: Initializable
    
    static func initialPositions(color: Color) -> [Position] {
        let rank: Int = color == .black ? 1 : 6
        let files: [Int] = [Int](0...7)
        
        return files.map({ file in
            Position(rank: rank, file: file)
        })
    }
    
    init(color: Color) {
        possibleDirections = color == .black ? [.down] : [.up]
        self.color = color
    }
}
