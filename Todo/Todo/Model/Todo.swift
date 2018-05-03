//
//  Todo.swift
//  Todo
//
//  Created by Kristóf Varga on 2018. 03. 22..
//  Copyright © 2018. com.attrecto.academy. All rights reserved.
//

import UIKit

class Todo: NSObject, Codable {

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

enum TodoPriority: String, Codable {

    case high = "High"
    case normal = "Normal"
    case low = "Low"

    init(value: Int) {
        switch value {
        case 0:
            self = .high
        case 1:
            self = .normal
        default:
            self = .low
        }
    }
    
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
