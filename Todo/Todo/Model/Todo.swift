//
//  Todo.swift
//  Todo
//
//  Created by Kristóf Varga on 2018. 03. 22..
//  Copyright © 2018. com.attrecto.academy. All rights reserved.
//

import UIKit

class Todo: NSObject {

    let title: String
    let todoDescription: String?
    let date: Date?
    let priority: TodoPriority

    init(title: String, todoDescription: String?, date: Date?, priority: TodoPriority = .normal) {
        self.title = title
        self.todoDescription = todoDescription
        self.date = date
        self.priority = priority
    }
}

enum TodoPriority {
    case high
    case normal
    case low
    
    func value() -> Int {
        switch self {
        case .high:
            return 0
        case .normal:
            return 1
        case .low:
            return 2
        }
    }
    
}
