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
        
        self.colorRed()
    }
    
    func colorRed() {
        // RGB is normalized on iOS.
        self.view.backgroundColor = UIColor(red: 255 / 255, green: 0, blue: 0, alpha: 1)
    }
}

