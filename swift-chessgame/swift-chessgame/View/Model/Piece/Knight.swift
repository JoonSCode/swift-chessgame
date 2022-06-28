//
//  Knight.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/20.
//

import Foundation

struct Knight: Pieceable {
    var color: Color
    let score: Int = 3
    var shape: String {
        return color == .black ? "♞" : "♘"
    }
    
    let movableCount: Int = 2
    let possibleDirections: [Direction]
    // MARK: Initializable
    
    static func initialPositions(color: Color) -> [Position] {
        let rank: Int = color == .black ? 0 : 7
        let files: [Int] = [1,6]
        
        return files.map({ file in
            Position(rank: rank, file: file)
        })
    }
    
    init(color: Color) {
        possibleDirections = [.left, .right, .up, .down]
        self.color = color
    }
}