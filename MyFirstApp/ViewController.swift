//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Meg Grasse on 12/7/20.
//

import UIKit

class ViewController: UIViewController {

    let timeLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addTimeLabel()
        self.addNavigationButton()

        // Since our timeStyle is `.medium`, we only need to update it every second,
        // since that's the most precision we'll ever display.
        let _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.updateTime()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Move `strobe` to `viewWillAppear` which is called when the user
        // presses the back button to restart the animation (as opposed to
        // `viewDidLoad()`, which is only called the first time the view loads).
        self.strobe()
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
            NSLayoutConstraint(item: timeLabel, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: -50),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func addNavigationButton() {
        let action = UIAction(title: "Navigate") { _ in
            let destinationViewController = UIViewController()
            destinationViewController.view.backgroundColor = .purple
            // By navigating to the destinationViewController for free the system configures
            // a navigation bar UI for free, including a back button.
            self.navigationController?.pushViewController(destinationViewController, animated: true)
        }
        
        let navigationButton = UIButton(type: .system, primaryAction: action)
        navigationButton.translatesAutoresizingMaskIntoConstraints = false
        navigationButton.tintColor = .orange
        navigationButton.sizeToFit()
        self.view.addSubview(navigationButton)
        
        let constraints = [
            NSLayoutConstraint(item: navigationButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: navigationButton, attribute: .centerY, relatedBy: .equal, toItem: self.timeLabel, attribute: .centerY, multiplier: 1, constant: -50),
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
        // (1.2) Include the `.allowUserInteraction` option so our `navigationButton` is clickable
        // while the superview is animating.
        UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .allowUserInteraction], animations: {
            self.view.backgroundColor = .green
            self.view.backgroundColor = .blue
        })
    }
}
