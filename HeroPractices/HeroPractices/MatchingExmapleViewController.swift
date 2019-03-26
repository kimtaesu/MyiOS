//
//  MatchingExmapleViewController.swift
//  HeroPractices
//
//  Created by tskim on 25/03/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import UIKit

class MatchingExmapleViewController: ExampleBaseViewController {

    let redView = UIView()
    let blackView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        redView.backgroundColor = UIColor.red
        redView.hero.id = "ironMan"
        redView.layer.cornerRadius = 8
        view.addSubview(redView)

        blackView.backgroundColor = UIColor.black
        blackView.hero.id = "batMan"
        blackView.layer.cornerRadius = 8
        view.addSubview(blackView)

        view.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(onTap)))
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        redView.frame.size = CGSize(width: 200, height: 200)
        blackView.frame.size = CGSize(width: 200, height: 80)
        redView.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY + 50)
        blackView.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY - 90)
    }

    @objc
    override func onTap() {
        let vc2 = MatchExampleViewController2()
        vc2.hero.isEnabled = true
        present(vc2, animated: true, completion: nil)
    }
}

class MatchExampleViewController2: ExampleBaseViewController {
    let redView = UIView()
    let blackView = UIView()
    let whiteView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        redView.backgroundColor = UIColor.red
        redView.hero.id = "ironMan"
        view.insertSubview(redView, belowSubview: dismissButton)
        blackView.backgroundColor = UIColor.black
        blackView.hero.id = "batMan"
        blackView.layer.cornerRadius = 8
        view.addSubview(blackView)

        whiteView.backgroundColor = .white
        whiteView.layer.cornerRadius = 8
        // .useGlobalCoordinateSpace modifier is needed here otherwise it will be covered by redView during transition.
        // see http://lkzhao.com/2018/03/02/hero-useglobalcoordinatespace-explained.html for detail
        whiteView.hero.modifiers = [.translate(y: 500), .useGlobalCoordinateSpace]
        view.addSubview(whiteView)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        redView.frame = view.bounds
        blackView.frame.size = CGSize(width: 250, height: 60)
        blackView.center = CGPoint(x: view.bounds.midX, y: 130)
        whiteView.frame = CGRect(x: (view.bounds.width - 250) / 2, y: 180, width: 250, height: view.bounds.height - 320)
    }
}
