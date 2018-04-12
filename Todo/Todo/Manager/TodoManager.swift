//
//  TodoManager.swift
//  Todo
//
//  Created by Papp Balazs on 2018. 04. 05..
//  Copyright © 2018. com.attrecto.academy. All rights reserved.
//

// TodoManager.sharedInstance

class TodoManager {
    
    static let sharedInstance = TodoManager()
    
    var todos: [Todo] = []
    
    private init() {
    }
    
    func addTodo(todo: Todo) {
        self.todos.append(todo)
    }
    
    func addTodos(todos: [Todo]) {
        self.todos.append(contentsOf: todos)
    }
    
//    func todoByTag(tag: String) -> Todo {
//        // TODO: add tag to Todo object
//        // TODO: return Todo by tag
//    }

}
