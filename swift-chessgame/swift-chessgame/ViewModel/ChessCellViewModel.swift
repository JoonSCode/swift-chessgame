//
//  ChessCellViewModel.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/27.
//

import Foundation

class ChessCellViewModel: Hashable {
    var id = UUID()
    var isMovableLocation: Bool
    var piece: Pieceable?
    
    init(isMovableLocation: Bool, piece: Pieceable?) {
        self.isMovableLocation = isMovableLocation
        self.piece = piece
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(isMovableLocation)
    }
    
    static func == (lhs: ChessCellViewModel, rhs: ChessCellViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}
