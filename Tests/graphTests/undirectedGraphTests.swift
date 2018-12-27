import XCTest
@testable import graph

final class undirectedGraphTests: XCTestCase {
    
    var graph : UndirectedGraph<Int> = UndirectedGraph<Int>()
    
    override func setUp() {
        graph = UndirectedGraph<Int>()
    }
    
    func testExample() {
        
        graph.add_vertex(vertex: 2)
        let vertex_count = graph.vertex_count()
        
        XCTAssertEqual(vertex_count, 1)
    }
    
    func testShouldAddVerticies() {
        
        graph.add_verticies(verticies: 3, 4, 1)
        let vertex_count = graph.vertex_count()
        
        XCTAssertEqual(vertex_count, 3)
    }
    
    func testShouldRemoveVertex() {
        graph.add_verticies(verticies: 1, 2, 3)
        XCTAssertEqual(graph.vertex_count(), 3)
        
        graph.remove_vertex(vertex: 2)
        XCTAssertEqual(graph.vertex_count(), 2)
    }
    
    func testRemovingNonPresent() {
        graph.add_verticies(verticies: 1,2)
        graph.remove_vertex(vertex: 3)
        
        XCTAssertEqual(graph.vertex_count(), 2)
    }
    
    func testAddingEdgeShouldAddVerticies() {
        graph.add_edge(from: 1, to: 2)
        
        XCTAssertEqual(graph.vertex_count(), 2)
    }
    
    func testAddingEdgeShouldIncreaseEdgeCount() {
        graph.add_verticies(verticies: 1, 2)
        
        let initialEdgeCount = graph.edge_count()
        graph.add_edge(from: 1, to: 2)
        
        XCTAssertEqual(graph.edge_count(), initialEdgeCount + 1)
    }
    
    func testSelfLoopsCountTowardsEdgeCount() {
        let initialEdgeCount = graph.edge_count();
        graph.add_edge(from: 2, to: 2);
        
        XCTAssertEqual(graph.edge_count(), initialEdgeCount + 1)
    }
    
    func testAddEdge() {
        graph.add_vertex(vertex: 30)
        graph.add_edge(from: 10, to: 20)
        
        XCTAssertEqual(graph.adjacents(to: 10).contains(20), true)
        XCTAssertEqual(graph.adjacents(to: 20).contains(10), true)
        XCTAssertEqual(graph.adjacents(to: 30).isEmpty, true)
    }

    static var allTests = [
        ("testExample", testExample),
        ("shouldAddVerticies", testShouldAddVerticies),
        ("testShouldRemoveVertex", testShouldRemoveVertex),
        ("testRemovingNonPresent", testRemovingNonPresent)
    ]
}
