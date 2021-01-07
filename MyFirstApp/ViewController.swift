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
    let timeLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addYellowSubview()
        self.addTimeLabel()
        self.strobe()
        
        // (4) Add a timer to update the label
        // so it always shows the current time.

        // Since our timeStyle is `.medium`, we only need to update it every second,
        // since that's the most precision we'll ever display.
        let _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.updateTime()
        }
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
    
    func addTimeLabel() {
        timeLabel.textColor = .white
        timeLabel.sizeToFit()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.updateTime()
        
        self.view.addSubview(timeLabel)
        
        // Since we used `sizeToFit` to size the view
        // based on whatever we supply in `text`,
        // we don't need to set size constraints,
        // only constraints for the position of the label.
        let constraints = [
            NSLayoutConstraint(item: timeLabel, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: timeLabel, attribute: .centerY, relatedBy: .equal, toItem: self.yellowSubview, attribute: .centerY, multiplier: 1, constant: -50),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

    func updateTime() {
        // The default initializer for `Date` corresponds to the current date + time.
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium
        let nowText = dateFormatter.string(from: now)
        timeLabel.text = nowText
    }
    
    func strobe() {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat], animations: {
            self.view.backgroundColor = .green
            self.view.backgroundColor = .blue
        })
    }
}
