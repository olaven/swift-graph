//
//  DirectedGraph.swift
//  graph
//
//  Created by Olav on 27/12/2018.
//

import Foundation

class DirectedGraph<Vertex: Hashable> : Graph {
    
    private var graph: [Vertex: Set<Vertex>]
    
    init() {
        graph = [Vertex: Set<Vertex>]()
    }
    
    func add_vertex(vertex: Vertex) {
        if graph[vertex] == nil {
            graph[vertex] = Set()
        }
    }
    
    func add_verticies(verticies: Vertex...) {
        for vertex in verticies {
            add_vertex(vertex: vertex)
        }
    }
    
    func remove_vertex(vertex: Vertex) {
        for adjacent in adjacents(to: vertex) {
            graph[adjacent]?.remove(vertex)
        }
    }
    
    func add_edge(from start: Vertex, to end: Vertex) {
        add_verticies(verticies: start, end)
        
        graph[start]?.insert(end) // Directed graph is simpler
    }
    
    func remove_edge(from start: Vertex, to end: Vertex) {
        graph[start]?.remove(end)
    }
    
    func edge_count() -> Int {
        var count = 0
        for (_, adjacents) in graph {
            count += adjacents.count
        }
        return count
    }
    
    func vertex_count() -> Int {
        return graph.count
    }
    
    func adjacents(to vertex: Vertex) -> Set<Vertex> {
        return graph[vertex]!
    }
    
    
}
