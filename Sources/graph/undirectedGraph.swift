//
//  UndirectedGraph.swift
//  graph
//
//  Created by Olav on 27/12/2018.
//

import Foundation

class UndirectedGraph<Vertex: Hashable> : Graph {
    
    private var graph: [Vertex: Set<Vertex>]
    
    init() {
        graph = [Vertex: Set<Vertex>]()
    }

    // ----------------------
    // methods from protocol:
    // ----------------------
    
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
        if graph[vertex] == nil {
            return
        }
        
        //remove from all connected
        let adjacents = graph[vertex];
        for adjacent in adjacents ?? Set() { // loops through emty set if not present
            if var verticies = graph[adjacent] {
                verticies.remove(vertex)
            }
        }
        // remove myself from graph
        graph.removeValue(forKey: vertex)
    }
    
    func add_edge(from start: Vertex, to end: Vertex) {
        add_verticies(verticies: start, end)
        
        graph[start]?.insert(end)
        graph[end]?.insert(start)
    }
    
    func remove_edge(from start: Vertex, to end: Vertex) {
        graph[start]?.remove(end)
        graph[end]?.remove(start)
    }
    
    func edge_count() -> Int {
        var sum = 0
        for (vertex, adjacents) in graph {
            
            sum += adjacents.count
            
            for adjacent in adjacents {
                if adjacent == vertex {
                    sum += 1
                }
            }
        
        }
        
        return sum / 2
    }
    
    func vertex_count() -> Int {
        return graph.count
    }
    
    func adjacents(to vertex: Vertex) -> Set<Vertex> {
        return graph[vertex] ?? Set();
    }
    
}
