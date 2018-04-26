//
//  TodoError.swift
//  Todo
//
//  Created by Papp Balazs on 2018. 04. 26..
//  Copyright © 2018. com.attrecto.academy. All rights reserved.
//

import UIKit

class TodoError: NSObject {
    
    let errorDescription: String
    
    init?(errorDescription: String) {
        if errorDescription == "" {
            return nil
        }
        
        self.errorDescription = errorDescription
        
        super.init()
    }

}
