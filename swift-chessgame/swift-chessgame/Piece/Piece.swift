//
//  Piece.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/20.
//

import Foundation

class Piece { // 생성 관련
    let color: Color
    let score: Int
    var value: String {
        return ""
    }

    class var initialFile: [Int] {
        return []
    }
    
    class func initialRank(color: Color) -> Int {
        switch color {
        case .black:
            return 0
        case .white:
            return 7
        }
    }
    
    class func getInitialPositions(color: Color) -> [Position] {
        return initialFile.map({ file in
            Position(rank: initialRank(color: color), file: file)
        })
    }
    
    init(color: Color, score: Int) {
        self.color = color
        self.score = score
    }
    
    func isInInitialPosition(rank: Int, file: Int) -> Bool {
        return Piece.initialRank(color: color) == rank && Piece.initialFile.contains(file)
    }
}

class MovablePiece: Piece, Movable { //이동관련
    var position: Position
    var possibleDirection: [Direction]
    var maxRank: Int = 8
    var maxFile: Int = 8
    var movableCount: Int
    
    init(color: Color, score: Int, position: Position, possibleDirection: [Direction], movableCount: Int = 8) {
        self.position = position
        self.possibleDirection = possibleDirection
        self.movableCount = movableCount
        super.init(color: color, score: score)
    }
}


final class EmptyPiece: Piece {
    override var value: String {
        return "."
    }
    
    init() {
        super.init(color: .black, score: 0)
    }
}
