//
//  MainViewModel.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/27.
//

import Foundation
import Combine

final class MainViewModel {
    private let chessBoard: ChessBoard
    
    @Published var sectionViewModels: [SectionViewModel] = []
    @Published var error: ChessError = .wrongColor

    private var cancelBag: Set<AnyCancellable> = Set<AnyCancellable>()
    init() {
        chessBoard = ChessBoard()
        sectionViewModels = chessBoard.board.map({
            SectionViewModel(pieces: $0)
        })
    }
    
    func didSelectCell(cellViewModel: ChessCellViewModel) {
        let piece = cellViewModel.piece
        guard let movablePiece = piece
        else {
            error = .emptyPiece
            return
        }
        
        guard chessBoard.turn == movablePiece.color
        else {
            error = .wrongColor
            return
        }
        
        let movablePositions = chessBoard.getMovablePositions(piece: movablePiece)
        movablePositions.forEach({
            sectionViewModels[$0.rank].cellViewModels[$0.file].isMovableLocation = true
        })
    }
}
