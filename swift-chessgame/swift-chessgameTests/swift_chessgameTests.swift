//
//  swift_chessgameTests.swift
//  swift-chessgameTests
//
//  Created by 윤준수 on 2022/06/20.
//

import XCTest
@testable import swift_chessgame

class swift_chessgameTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let board = ChessBoard()
        board.display().forEach({
            print($0)
        })
        XCTAssertTrue(true)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
