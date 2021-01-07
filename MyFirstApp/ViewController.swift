//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Meg Grasse on 12/7/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addYellowSubview()
        self.strobe()
    }
    
    func addYellowSubview() {
        // (1) Add yellow subview to view hierarchy, and use constraints to orient it.
        let yellowSubview = UIView()
        yellowSubview.backgroundColor = .yellow
        
        // We must set `translatesAutoresizingMaskIntoConstraints` to false so we can specify our own constraints.
        // Otherwise, we'll have conflicting constraints.
        yellowSubview.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(yellowSubview)

        let constraints = [
            NSLayoutConstraint(item: yellowSubview, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0, constant: 50),
            NSLayoutConstraint(item: yellowSubview, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0, constant: 50),
            NSLayoutConstraint(item: yellowSubview, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: yellowSubview, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
        ]

        NSLayoutConstraint.activate(constraints)
    }
    
    func strobe() {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat], animations: {
            self.view.backgroundColor = .green
            self.view.backgroundColor = .blue
        })
    }
}
