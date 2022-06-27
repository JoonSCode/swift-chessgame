//
//  Error.swift
//  swift-chessgame
//
//  Created by 윤준수 on 2022/06/27.
//

import Foundation

enum ChessError: Error {
    case emptyPiece
    case wrongColor
    case wrongMove
}
