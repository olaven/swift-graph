//
//  graph.swift
//  graph
//
//  Created by Olav on 27/12/2018.
//

import Foundation

protocol Graph {
    associatedtype Vertex : Hashable
    
    func add_vertex(vertex: Vertex)
    
    func add_verticies(verticies: Vertex...)
    
    func remove_vertex(vertex: Vertex)

    func add_edge(from start: Vertex, to end: Vertex)
    
    func remove_edge(from start: Vertex, to end: Vertex)
    
    func edge_count() -> Int
    
    func vertex_count() -> Int
    
    func adjacents(to: Vertex) -> Set<Vertex>
}

//TODO: Implement extensions
enum CustomError : Error {
    case NotImplementedError
}
extension Graph {
    
    func bfs() throws -> Array<Vertex> {
        throw CustomError.NotImplementedError
    }
    
    func dfs() throws -> Array<Vertex> {
        throw CustomError.NotImplementedError
    }
}
