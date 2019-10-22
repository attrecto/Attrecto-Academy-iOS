//
//  Section.swift
//  iOS_Academy_2019_2
//
//  Created by Németh Bendegúz on 2019. 10. 21..
//  Copyright © 2019. Attrecto. All rights reserved.
//

import Foundation

class Section {
    let priority: Todo.Priority
    var todos: [Todo]
    
    init(priority: Todo.Priority, todos: [Todo]) {
        self.priority = priority
        self.todos = todos
    }
}
