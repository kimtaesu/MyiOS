//
//  SnapkitMatchViewController.swift
//  HeroExample
//
//  Created by tskim on 26/03/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import UIKit
import SnapKit
import Hero

class SnapkitMatchViewController: UIViewController {
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
        blueButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.leading.equalToSuperview().offset(50)
        }
        blueButton.hero.id = "blueButton"
        blueButton.hero.modifiers = [.arc]
        
        view.addSubview(blueLabel)
        blueLabel.snp.makeConstraints { make in
            make.centerX.equalTo(blueButton.snp.centerX)
            make.bottom.equalTo(blueButton.snp.top).offset(-50)
        }
        blueLabel.hero.id = "blueLabel"
        
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
        }
        nextButton.addTarget(self, action: #selector(nextView), for: .touchUpInside)
    }
    @objc
    func nextView() {
        let nextVC = SnapkitMatchViewController2()
        nextVC.hero.isEnabled = true
        self.present(nextVC, animated: true)
    }
}


class SnapkitMatchViewController2: UIViewController {
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
        blueButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(150)
            make.leading.equalToSuperview().offset(50)
        }
        blueButton.hero.id = "blueButton"
        
        view.addSubview(blueLabel)
        blueLabel.snp.makeConstraints { make in
            make.centerX.equalTo(blueButton.snp.centerX)
            make.bottom.equalTo(blueButton.snp.top).offset(-50)
        }
        blueLabel.hero.id = "blueLabel"
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
        }
        backButton.addTarget(self, action: #selector(backView), for: .touchUpInside)
    }
    @objc
    func backView() {
        hero.dismissViewController()
    }
}


