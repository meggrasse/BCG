//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Meg Grasse on 12/7/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.loop()
    }
    
    func loop() {
        // (1) show for loop syntax in swift and different range operators [... vs ..<],
        // using print, so students can discern the difference.
        for i in 0..<10 {
            print(i)
        }
        
        // (2) show how to use variables in Swift.
        // `var` - show i can be assigned to a mutable var.
        // `let` - variable's value can never change. Show how the compiler enforces this.
        // Pause for 5 minutes to let students play on their own and get comfortable with the loop syntax.
        var index = 0
        for i in 0..<10 {
            index = i
            print(index)
        }
        
        // (3) Introduce the `stride` function, so students can count by
        // decimal increments and  count down.
        for i in stride(from: 1, to: 0, by: -0.001) {
            print(i)
        }
    }
}

