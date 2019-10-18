//
//  TodoManager.swift
//  iOS_Academy_2019_2
//
//  Created by Kristof Varga on 2019. 10. 01..
//  Copyright © 2019. Attrecto. All rights reserved.
//

import Foundation

class TodoManager {
    
    static let todoKey = "myTodos"
    static let shared = TodoManager()
    
    var allTodos: [Todo] = []
    
    private init() {
        allTodos = loadTodos()
    }
    
    func addTodo(todo: Todo) {
        allTodos.append(todo)
        saveTodos()
    }
    
    func saveTodos() {
        guard let jsonData = try? JSONEncoder().encode(allTodos) else {return}
        UserDefaults.standard.set(jsonData, forKey: TodoManager.todoKey)
    }
    
    func loadTodos() -> [Todo] {
        guard let jsonData = UserDefaults.standard.data(forKey: TodoManager.todoKey) else {return []}
        guard let decodedTodos = try? JSONDecoder().decode([Todo].self, from: jsonData) else {return []}
        return decodedTodos
    }
}
