//
//  Todo.swift
//  iOS_Academy_2019_2
//
//  Created by Kristof Varga on 2019. 10. 01..
//  Copyright © 2019. Attrecto. All rights reserved.
//

import Foundation

struct Todo {
    let title: String
    let description: String
    let date: Date
    let priority: Priority
    
    enum Priority {
        case low, medium, high
    }
}
