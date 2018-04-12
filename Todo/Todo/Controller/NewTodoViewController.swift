//
//  NewTodoViewController.swift
//  Todo
//
//  Created by Ádám Török on 2018. 04. 12..
//  Copyright © 2018. com.attrecto.academy. All rights reserved.
//

import UIKit

class NewTodoViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var priorityPicker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    @IBAction func saveTodo(_ sender: Any) {
    }

    // MARK: - Class methods

    func setupView() {
    }

}
