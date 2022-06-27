//
//  swift_chessgameTests.swift
//  swift-chessgameTests
//
//  Created by 윤준수 on 2022/06/20.
//

import XCTest
@testable import swift_chessgame

class swift_chessgameTests: XCTestCase {

    private var board: ChessBoard!
    
    override func setUpWithError() throws {
        board = ChessBoard()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
    
    func testScore() throws {
        let initialScore: [Int] = [39,39]
        
        XCTAssertEqual(initialScore, board.caculateScore())
    }
    
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
