//
//  PieceMoverTests.swift
//  swift-chessgameTests
//
//  Created by 윤준수 on 2022/06/20.
//

import XCTest
@testable import swift_chessgame

class PieceMoverTests: XCTestCase {

    private var board: [[Pieceable?]]!
    private var pieceMover: PieceMover!
    
    override func setUpWithError() throws {
        board = [[Pieceable?]](repeating: [Pieceable?](repeating: nil, count: 8), count: 8)
        pieceMover = PieceMover()
    }
    
    func setPiece(position: Position, piece: Pieceable) {
        board[position.rank][position.file] = piece
    }
    
    func testBlackPawnMovable() throws {
        //given
        let pawn = Pawn(color: .black)
        let initialPosition = Position(rank: 3, file: 3)
        setPiece(position: initialPosition, piece: pawn)
        
        //when
        let movablePositions = pieceMover.getMovablePositions(board: board, piece: pawn, from: initialPosition)
        
        //then
        let downOffset = Position(rank: 1, file: 0)
        let correctMovablePositions = [Position(rank: initialPosition.rank + downOffset.rank, file: initialPosition.file + downOffset.file)]
        XCTAssertEqual(correctMovablePositions, movablePositions)
    }
    
    func testWhitePawnMovable() throws {
        //given
        let pawn = Pawn(color: .white)
        let initialPosition = Position(rank: 3, file: 3)
        setPiece(position: initialPosition, piece: pawn)
        
        //when
        let movablePositions = pieceMover.getMovablePositions(board: board, piece: pawn, from: initialPosition)
        
        //then
        let upOffset = Position(rank: -1, file: 0)
        let correctMovablePositions = [Position(rank: initialPosition.rank + upOffset.rank, file: initialPosition.file + upOffset.file)]
        XCTAssertEqual(correctMovablePositions, movablePositions)
    }
    
    func testRookMovableTest() throws {
        //given
        let initialPosition = Position(rank: 3, file: 3)
        let rook = Rook(color: .black)
        setPiece(position: initialPosition, piece: rook)
        //when
        let movablePositions = pieceMover.getMovablePositions(board: board, piece: rook, from: initialPosition)
        
        //then
        var correctMovablePositions: Set<Position> = []
        for i in 0...7 {
            guard i != 3 else { continue }
            correctMovablePositions.insert(Position(rank: 3, file: i))
            correctMovablePositions.insert(Position(rank: i, file: 3))
        }
        
        XCTAssertEqual(correctMovablePositions, Set(movablePositions))
    }
    
    func testBishopMovableTest() throws {
        //given
        let initialPosition = Position(rank: 3, file: 3)
        let bishop = Bishop(color: .black)
        setPiece(position: initialPosition, piece: bishop)
        
        //when
        let movablePositions = pieceMover.getMovablePositions(board: board, piece: bishop, from: initialPosition)

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
        
        XCTAssertEqual(correctMovablePositions, Set(movablePositions))
    }

    func testQueenMovableTest() throws {
        //given
        let initialPosition = Position(rank: 3, file: 3)
        let queen = Queen(color: .black)
        setPiece(position: initialPosition, piece: queen)
        
        //when
        let movablePositions = pieceMover.getMovablePositions(board: board, piece: queen, from: initialPosition)

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
        
        XCTAssertEqual(correctMovablePositions, Set(movablePositions))
    }

    
    func testMovableWithSameColorPiece() throws {
        //given
        let initialPosition = Position(rank: 3, file: 3)
        let rook = Rook(color: .black)
        setPiece(position: initialPosition, piece: rook)
        
        //when
        setPiece(position: Position(rank: 3, file: 2), piece: Bishop(color: .black))
        setPiece(position: Position(rank: 3, file: 5), piece: Bishop(color: .black))
        let movablePositions = pieceMover.getMovablePositions(board: board, piece: rook, from: initialPosition)
        
        //then
        var correctMovablePositions: Set<Position> = []
        for i in 0...7 {
            guard i != 3 else { continue }
            correctMovablePositions.insert(Position(rank: i, file: 3))
        }
        correctMovablePositions.insert(Position(rank: 3, file: 4))
        XCTAssertEqual(correctMovablePositions, Set(movablePositions))
    }
    
    func testMovableWithDifferentColorPiece() throws {
        //given
        let initialPosition = Position(rank: 3, file: 3)
        let rook = Rook(color: .black)
        setPiece(position: initialPosition, piece: rook)
        
        //when
        setPiece(position: Position(rank: 3, file: 1), piece: Bishop(color: .black))
        setPiece(position: Position(rank: 3, file: 5), piece: Bishop(color: .white))
        let movablePositions = pieceMover.getMovablePositions(board: board, piece: rook, from: initialPosition)
        
        //then
        var correctMovablePositions: Set<Position> = []
        for i in 0...7 {
            guard i != 3 else { continue }
            correctMovablePositions.insert(Position(rank: i, file: 3))
        }
        correctMovablePositions.insert(Position(rank: 3, file: 2))
        correctMovablePositions.insert(Position(rank: 3, file: 4))
        correctMovablePositions.insert(Position(rank: 3, file: 5))
        XCTAssertEqual(correctMovablePositions, Set(movablePositions))
    }
}
