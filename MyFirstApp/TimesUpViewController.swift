//
//  TimesUpViewController.swift
//  MyFirstApp
//
//  Created by Meg Grasse on 12/13/20.
//

import UIKit

class TimesUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .cyan

        let label = UILabel()
        label.text = "⏰ 2020 you will not be missed! ⏰"
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        
        let constraints = [
            NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

}
