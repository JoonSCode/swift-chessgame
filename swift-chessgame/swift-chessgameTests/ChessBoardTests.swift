//
//  ChessBoardTests.swift
//  swift-chessgameTests
//
//  Created by 윤준수 on 2022/06/29.
//

import XCTest
@testable import swift_chessgame

class ChessBoardTests: XCTestCase {

    private var board: ChessBoard!
    
    override func setUpWithError() throws {
        board = ChessBoard()
    }

    func testBoardInit() throws {
        let resultAfterInit: [String] = [" ABCDEFGH",
                                         "1♜♞♝.♛♝♞♜",
                                         "2♟♟♟♟♟♟♟♟",
                                         "3........",
                                         "4........",
                                         "5........",
                                         "6........",
                                         "7♙♙♙♙♙♙♙♙",
                                         "8♖♘♗.♕♗♘♖",
                                         " ABCDEFGH"]
        
        XCTAssertEqual(resultAfterInit, board.display())
    }
    
    func testInitScore() throws {
        let initialScore: [Int] = [39,39]
        
        XCTAssertEqual(initialScore, board.caculateScore())
    }
}
