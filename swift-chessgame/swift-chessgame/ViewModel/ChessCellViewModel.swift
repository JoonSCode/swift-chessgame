//
//  ChessCellViewModel.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/27.
//

import Foundation

class ChessCellViewModel: Hashable {
    var isMovableLocation: Bool
    var piece: Piece
    
    init(isMovableLocation: Bool, piece: Piece) {
        self.isMovableLocation = isMovableLocation
        self.piece = piece
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(piece)
        hasher.combine(isMovableLocation)
    }
    
    static func == (lhs: ChessCellViewModel, rhs: ChessCellViewModel) -> Bool {
        return lhs.piece == rhs.piece && lhs.isMovableLocation == rhs.isMovableLocation
    }
}
