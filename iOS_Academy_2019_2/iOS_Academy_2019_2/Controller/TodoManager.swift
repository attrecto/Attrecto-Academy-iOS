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
    
    var allTodos: [Todo] = [
        Todo(title: "Tej", description: "vegyél tejet!", date: Date(), priority: .low),
        Todo(title: "Kenyér", description: "vegyél kenyeret!", date: Date(), priority: .medium),
        Todo(title: "Vaj", description: "vegyél kenyeret!", date: Date(), priority: .high)
    ]
    
    private init() {
        
    }
    
}
