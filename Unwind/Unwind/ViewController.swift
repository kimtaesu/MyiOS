//
//  ViewController.swift
//  Unwind
//
//  Created by tskim on 26/03/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func unwindCode(_ sender: Any) {
        let contentVC = Code1()
        contentVC.seq = "1"
        let vc = UINavigationController(rootViewController: contentVC)
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func unwindStoryboard(_ sender: Any) {
        let stry = UIStoryboard(name: "Unwind", bundle: nil)
        let vc = stry.instantiateInitialViewController()!
        self.present(vc, animated: true)
    }
}

