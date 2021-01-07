//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Meg Grasse on 12/7/20.
//

import UIKit

class ViewController: UIViewController {
    
    // This defines `yellowSubview` as a property scoped to ViewController,
    // which means we can access it anywhere in this class.
    // As opposed to only being able to access in it `addYellowSubview`,
    // when it was locally defined there.
    let yellowSubview = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addYellowSubview()
        self.addNameLabel()
        self.strobe()
    }
    
    func addYellowSubview() {
        // (1) Add yellow subview to view hierarchy, and use constraints to orient it.
        self.yellowSubview.backgroundColor = .yellow

        // We must set `translatesAutoresizingMaskIntoConstraints` to false so we can specify our own constraints.
        // Otherwise, we'll have conflicting constraints.
        self.yellowSubview.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(yellowSubview)

        let constraints = [
            NSLayoutConstraint(item: yellowSubview, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0, constant: 50),
            NSLayoutConstraint(item: yellowSubview, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0, constant: 50),
            NSLayoutConstraint(item: yellowSubview, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: yellowSubview, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
        ]

        NSLayoutConstraint.activate(constraints)
    }
    
    func addNameLabel() {
        // (2) Add label of your name to the view hierarchy.
        let nameLabel = UILabel()
        nameLabel.text = "Meg"
        nameLabel.textColor = .white
        nameLabel.sizeToFit()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(nameLabel)
        
        // Since we used `sizeToFit` to size the view
        // based on whatever we supply in `text`,
        // we don't need to set size constraints,
        // only constraints for the position of the label.
        let constraints = [
            NSLayoutConstraint(item: nameLabel, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: nameLabel, attribute: .centerY, relatedBy: .equal, toItem: self.yellowSubview, attribute: .centerY, multiplier: 1, constant: -50),
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
