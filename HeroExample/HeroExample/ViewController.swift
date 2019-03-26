//
//  ViewController.swift
//  HeroExample
//
//  Created by tskim on 26/03/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func basicSnapkit(_ sender: Any) {
        self.present(SnapkitMatchViewController(), animated: true)
    }
    @IBAction func basicFrame(_ sender: Any) {
        self.present(FrameMatchViewcontroller(), animated: true)
    }
}

