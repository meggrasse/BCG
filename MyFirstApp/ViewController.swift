//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Meg Grasse on 12/7/20.
//

import UIKit

class ViewController: UIViewController {

    // TODO: Figure out why we need `viewDidAppear` here.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.strobe()
    }
    
    func strobe() {
        // (1) Show how to use `animate` to achieve a strobe light effect
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            self.view.backgroundColor = .green
            self.view.backgroundColor = .blue
        })
        
        // (2) Supply `.repeat`, and explain this is kind of like a for loop.
        UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat], animations: {
            self.view.backgroundColor = .green
            self.view.backgroundColor = .blue
        })
        
        // (3) Use random function to strobe a random color.
        let range: Range<CGFloat> = Range(uncheckedBounds: (0.0, 1.0))
        UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat], animations: {
            self.view.backgroundColor = UIColor(
                red: CGFloat.random(in: range),
                green: CGFloat.random(in: range),
                blue: CGFloat.random(in: range),
                alpha: 1
            )
        })
            
        // (4?) If time permits, use a timer to stop animations.
        let _ = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
            self.view.layer.removeAllAnimations()
        }
    }
}

