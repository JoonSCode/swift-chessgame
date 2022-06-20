//
//  Luke.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/20.
//

import Foundation

final class Luke: Piece {
    override var value: String {
        return color == .black ? "♜" : "♖"
    }
    
    init(color: Color) {
        super.init(color: color, score: 5, move: .straight)
    }
}
