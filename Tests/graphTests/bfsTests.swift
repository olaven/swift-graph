//
//  bfsTests.swift
//  Collections
//
//  Created by Olav on 01/01/2019.
//

import XCTest
@testable import graph

final class bfsTests: XCTestCase {
    
    var graph : UndirectedGraph<Int> = UndirectedGraph<Int>()
    
    override func setUp() {
        graph = buildGraph()
    }
    
    func testBFSReturnsAPath() {
        let path = graph.bfs(from: 1, to: 2)
        XCTAssertNotNil(path)
    }
    
    func testBFSReturnsValidPath() {
        let path = graph.bfs(from: 1, to: 2)
        
        if let last = path?.last {
            XCTAssertEqual(last, 2)
        }
    }
    
    func testShortestPathIsChosen() {
        for _ in 1...10 {
            let path = graph.bfs(from: 2, to: 6)
            
            XCTAssertEqual(path?.count, 3) // not 4
        }
    }
    
    private func buildGraph() -> UndirectedGraph<Int> {
        
        /*
            *
            |
         1--2--3--4
         |  |  |  |
         5--|  |--6      7--8
         
        */
        let graph = UndirectedGraph<Int>()
        
        graph.add_edge(from: 1, to: 2)
        graph.add_edge(from: 2, to: 3)
        graph.add_edge(from: 3, to: 4)
        
        graph.add_edge(from: 1, to: 5)
        graph.add_edge(from: 2, to: 5)
        
        graph.add_edge(from: 2, to: 2)
        
        graph.add_edge(from: 4, to: 6)
        graph.add_edge(from: 6, to: 3)
        
        graph.add_edge(from: 7, to: 8)
        
        return graph
    }
    
    static var allTests = [
        ("testBFSReturnsAPath", testBFSReturnsAPath)
    ]
}
