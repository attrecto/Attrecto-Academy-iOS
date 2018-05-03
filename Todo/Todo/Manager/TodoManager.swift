//
//  TodoManager.swift
//  Todo
//
//  Created by Papp Balazs on 2018. 04. 05..
//  Copyright © 2018. com.attrecto.academy. All rights reserved.
//

// TodoManager.sharedInstance

import Foundation

class TodoManager: NSObject {
    
    static let sharedInstance = TodoManager()
    private let todosKey = "todosKey"
    
    var todos: [Todo] = []
    
    private override init() {
        super.init()
        self.todos = getTodos()
    }

    func save(todos: [Todo]) {
        if let encoded = try? JSONEncoder().encode(todos) {
            UserDefaults.standard.set(encoded, forKey: self.todosKey)
        }
    }

    func getTodos() -> [Todo] {
        guard let data = UserDefaults.standard.data(forKey: self.todosKey) else {
            return []
        }

        guard let todos = try? JSONDecoder().decode([Todo].self, from: data) else {
            return []
        }

        return todos
    }
    
    func addTodo(todo: Todo) {
        self.todos.append(todo)
        self.save(todos: self.todos)
    }
    
    func addTodos(todos: [Todo]) {
        self.todos.append(contentsOf: todos)
        self.save(todos: self.todos)
    }

    func delete(todo: Todo) {
        if let index = self.todos.index(of: todo) {
            self.todos.remove(at: index)
            self.save(todos: self.todos)
        }
    }

    func todos(for priority: TodoPriority) -> [Todo] {
        let filteredTodos = self.todos.filter { (todo) -> Bool in
            return todo.priority == priority
        }

        return filteredTodos
    }
    
//    func todoByTag(tag: String) -> Todo {
//        // TODO: add tag to Todo object
//        // TODO: return Todo by tag
//    }

}
