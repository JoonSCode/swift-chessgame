//
//  SectionViewModel.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/27.
//

import Foundation

struct SectionViewModel: Hashable {
    var cellViewModels: [ChessCellViewModel]
    
    init(pieces: [Pieceable?]) {
        cellViewModels = pieces.map({
            ChessCellViewModel(isMovableLocation: false, piece: $0)
        })
    }
}
