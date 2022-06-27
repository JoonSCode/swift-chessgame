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
    
    func testPawnMovableTest() throws {
        //given
        let initialPosition = Position(rank: 3, file: 3)
        let blackPawn = Pawn(color: .black, position: initialPosition)
        let whitePawn = Pawn(color: .white, position: initialPosition)
        
        //when
        let blackMovablePositions = blackPawn.getMovablePositions()
        let whiteMovablePositions = whitePawn.getMovablePositions()
        
        //then
        let downOffset = Position(rank: 1, file: 0)
        let blackCorrectMovablePositions = [Position(rank: initialPosition.rank + downOffset.rank, file: initialPosition.file + downOffset.file)]
        XCTAssertEqual(blackCorrectMovablePositions, blackMovablePositions)
        
        let upOffset = Position(rank: -1, file: 0)
        let whiteCorrectMovablePositions = [Position(rank: initialPosition.rank + upOffset.rank, file: initialPosition.file + upOffset.file)]
        XCTAssertEqual(whiteCorrectMovablePositions, whiteMovablePositions)
    }
    
    func testLukeMovableTest() throws {
        //given
        let initialPosition = Position(rank: 3, file: 3)
        let luke = Luke(color: .black, position: initialPosition)
        
        //when
        let movablePositions = Set(luke.getMovablePositions())
        
        //then
        var correctMovablePositions: Set<Position> = []
        for i in 0...7 {
            guard i != 3 else { continue }
            correctMovablePositions.insert(Position(rank: 3, file: i))
            correctMovablePositions.insert(Position(rank: i, file: 3))
        }
        
        XCTAssertEqual(correctMovablePositions, movablePositions)
    }
    
    func testBishopMovableTest() throws {
        //given
        let initialPosition = Position(rank: 3, file: 3)
        let bishop = Bishop(color: .black, position: initialPosition)
        
        //when
        let movablePositions = Set(bishop.getMovablePositions())

        //then
        var correctMovablePositions: Set<Position> = []
        for i in 1...3 {
            correctMovablePositions.insert(Position(rank: initialPosition.rank-i, file: initialPosition.file-i))
            correctMovablePositions.insert(Position(rank: initialPosition.rank-i, file: initialPosition.file+i))
        }
        
        for i in 1...4 {
            correctMovablePositions.insert(Position(rank: initialPosition.rank+i, file: initialPosition.file+i))
            if i != 4 {
                correctMovablePositions.insert(Position(rank: initialPosition.rank+i, file: initialPosition.file-i))
            }
        }
        
        XCTAssertEqual(correctMovablePositions, movablePositions)
    }

    func testQueenMovableTest() throws {
        //given
        let initialPosition = Position(rank: 3, file: 3)
        let queen = Queen(color: .black, position: initialPosition)
        
        //when
        let movablePositions = Set(queen.getMovablePositions())

        //then
        var correctMovablePositions: Set<Position> = []
        
        //대각선
        for i in 1...3 {
            correctMovablePositions.insert(Position(rank: initialPosition.rank-i, file: initialPosition.file-i))
            correctMovablePositions.insert(Position(rank: initialPosition.rank-i, file: initialPosition.file+i))
        }
        
        for i in 1...4 {
            correctMovablePositions.insert(Position(rank: initialPosition.rank+i, file: initialPosition.file+i))
            if i != 4 {
                correctMovablePositions.insert(Position(rank: initialPosition.rank+i, file: initialPosition.file-i))
            }
        }
        
        //가로세로
        for i in 0...7 {
            guard i != 3 else { continue }
            correctMovablePositions.insert(Position(rank: 3, file: i))
            correctMovablePositions.insert(Position(rank: i, file: 3))
        }
        
        XCTAssertEqual(correctMovablePositions, movablePositions)
    }

}
