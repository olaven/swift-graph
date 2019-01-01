//
//  graph.swift
//  graph
//
//  Created by Olav on 27/12/2018.
//

import Foundation
import Collections

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
    
    func bfs(from start: Vertex, to end: Vertex) -> Array<Vertex>? {
        let queue = Queue<Vertex>()
        var bestParent = [Vertex: Vertex]()
        
        queue.enqueue(value: start)
        
        outer: while(queue.count > 0) {
            let vertex = queue.dequeue()!
            
            for adjacent in adjacents(to: vertex) {
                if (bestParent[adjacent] != nil || adjacent == start) {
                    continue
                }
                
                bestParent[adjacent] = vertex
                
                if (adjacent == end) {
                    break outer
                }
                
                queue.enqueue(value: adjacent)
            }
        }
        
        if (bestParent[end] == nil) {
            return nil
        }
        
        var path = Array<Vertex>()
        
        var vertex = bestParent[end]
        path.insert(end, at: 0)
        
        while vertex != nil{
            path.insert(vertex!, at: 0)
            
            if bestParent[vertex!] == nil {
                break
            } else {
                vertex = bestParent[vertex!]
            }
        }
    
        
        return path
    }
    
    func dfs(from start: Vertex, to end: Vertex) -> Array<Vertex>? {
        var stack = Stack<Vertex>()
        var visited = Set<Vertex>()
        
        (stack, visited) = dfs(from: start, to: end, stack: stack, visited: visited)
        
        guard stack.peek() == end else {
            return nil
        }
        
        var path = [Vertex]()
        var current = stack.pop()
        
        while current != nil {
            path.insert(current!, at: 0)
            current = stack.pop()
        }
        
        return path
    }
    
    private func dfs(from current: Vertex, to end: Vertex, stack: Stack<Vertex>, visited: Set<Vertex>) -> (Stack<Vertex>, Set<Vertex>) {
        
        // mutable copies of aruments
        var visited = visited
        var stack = stack
        
        stack.push(value: current)
        visited.insert(current)
        
        if current == end {
            return (stack, visited)
        }
        
        for adjacent in adjacents(to: current) {
            if visited.contains(adjacent) {
                continue
            }
            
            (stack, visited) = dfs(from: adjacent, to: end, stack: stack, visited: visited)
            
            if stack.peek() != end {
                let _ = stack.pop()
            }
        }
        
        return (stack, visited)
    }
}


