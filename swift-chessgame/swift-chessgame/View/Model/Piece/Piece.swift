//
//  Piece.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/20.
//

import Foundation

protocol Pieceable {
    var color: Color { get }
    var score: Int { get }
    var shape: String { get }
    
    var possibleDirections: [Direction] { get }
    var movableCount: Int { get }
    
    static func initialPositions(color: Color) -> [Position]
    
    init(color: Color)
}
