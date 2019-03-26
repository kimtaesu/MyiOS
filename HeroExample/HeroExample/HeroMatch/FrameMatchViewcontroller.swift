//
//  SnapkitMatchViewController.swift
//  HeroExample
//
//  Created by tskim on 26/03/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import UIKit
import Hero

class FrameMatchViewcontroller: UIViewController {
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    private let blueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.blue
        return button
    }()
    
    private let blueLabel: UILabel = {
        let label = UILabel()
        label.text = "Blue"
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(blueButton)
        blueButton.hero.id = "blueButton"
        blueButton.hero.modifiers = [.arc]
        
        view.addSubview(blueLabel)
        blueLabel.sizeToFit()
        blueLabel.hero.id = "blueLabel"
        
        view.addSubview(nextButton)
        nextButton.sizeToFit()
        nextButton.addTarget(self, action: #selector(nextView), for: .touchUpInside)
    }
    @objc
    func nextView() {
        let nextVC = FrameMatchViewcontroller2()
        nextVC.hero.isEnabled = true
        self.present(nextVC, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        blueButton.frame = CGRect.init(x: 50, y: view.bounds.midY, width: 100, height: 100)
        blueLabel.center = CGPoint.init(x: blueButton.frame.midX, y: blueButton.frame.midY - 70)
        nextButton.center = CGPoint.init(x: view.bounds.midX, y: view.bounds.midY + view.bounds.height / 3)
        
    }
}


class FrameMatchViewcontroller2: UIViewController {
    private let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    private let blueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.blue
        return button
    }()
    
    private let blueLabel: UILabel = {
        let label = UILabel()
        label.text = "Blue"
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(blueButton)
        blueButton.hero.id = "blueButton"
        
        view.addSubview(blueLabel)
        blueLabel.sizeToFit()
        blueLabel.hero.id = "blueLabel"
        
        view.addSubview(backButton)
        backButton.sizeToFit()
        backButton.addTarget(self, action: #selector(backView), for: .touchUpInside)
    }
    @objc
    func backView() {
        hero.dismissViewController()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        blueButton.frame = CGRect.init(x: 50, y: view.bounds.midY - 50, width: 200, height: 150)
        blueLabel.center = CGPoint.init(x: blueButton.frame.midX, y: blueButton.frame.midY - 100)
        backButton.center = CGPoint.init(x: view.bounds.midX, y: view.bounds.midY + view.bounds.height / 3)
    }
}
