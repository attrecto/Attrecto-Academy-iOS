//
//  DetailViewController.swift
//  iOS_Academy_2019_2
//
//  Created by Kristof Varga on 2019. 10. 08..
//  Copyright © 2019. Attrecto. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var todo: Todo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeZone = Calendar.current.timeZone
        formatter.timeStyle = .none

        titleLabel.text = todo?.title ?? "Nincs adat"
        descriptionLabel.text = todo?.description ?? "Nincs adat"
        
        if let date = todo?.date {
            dateLabel.text = formatter.string(from: date)
        } else {
            dateLabel.text = "Nincs adat"
        }
    }
}
