//
//  ViewController.swift
//  HeroPractices
//
//  Created by tskim on 24/03/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class ViewController2: UIViewController, UIViewControllerTransitioningDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let vc2 = transitionContext.viewController(forKey:.to)!
        let con = transitionContext.containerView
        
        let r2end = transitionContext.finalFrame(for:vc2)
        
        let v2 = transitionContext.view(forKey:.to)!
        
        var r2start = r2end
        r2start.origin.y -= r2start.size.height
        v2.frame = r2start
        con.addSubview(v2)
        UIView.animate(withDuration:0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, animations: {
            v2.frame = r2end
        }, completion: {
            _ in
            transitionContext.completeTransition(true)
        })
    }
}

