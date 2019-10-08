//
//  TodoManager.swift
//  iOS_Academy_2019_2
//
//  Created by Kristof Varga on 2019. 10. 01..
//  Copyright © 2019. Attrecto. All rights reserved.
//

import Foundation

class TodoManager {
    
    static let shared = TodoManager()
    
    var allTodos: [Todo] = []
    
    private init() {
        
    }
    
    func addTodo(todo: Todo) {
        allTodos.append(todo)
    }
}
