//
//  ViewController.swift
//  HeroExample
//
//  Created by tskim on 26/03/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import UIKit
import Hero

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
    @IBAction func basicNavigation(_ sender: Any) {
        let vc = UINavigationController(rootViewController: SnapkitMatchViewController())
        vc.hero.isEnabled = true
        vc.hero.navigationAnimationType = .none
        self.present(vc, animated: true)
    }
    @IBAction func basicTab(_ sender: Any) {
        let vc = UITabBarController()
        vc.hero.isEnabled = true
        vc.hero.tabBarAnimationType = .selectBy(presenting: .slide(direction: .left), dismissing: .slide(direction: .right))
        let firstVC = SnapkitMatchViewController()
        firstVC.tabBarItem.title = "first"
        let secondVC = SnapkitMatchViewController2()
        secondVC.tabBarItem.title = "second"
        
        vc.viewControllers = [firstVC, secondVC]
        self.present(vc, animated: true)
    }
}
