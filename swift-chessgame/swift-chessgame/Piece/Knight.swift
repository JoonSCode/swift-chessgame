//
//  Knight.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/20.
//

import Foundation

final class Knight: Piece {
    override var value: String {
        return color == .black ? "♞" : "♘"
    }
    
    init(color: Color) {
        super.init(color: color, score: 3, move: .straight)
    }
}
