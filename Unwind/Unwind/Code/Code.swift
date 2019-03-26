//
//  Code1.swift
//  Unwind
//
//  Created by tskim on 26/03/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import UIKit
import Hero

class Code1: UIViewController {
    var seq: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let label = UILabel()
        view.addSubview(label)
        label.textColor = UIColor.blue
        label.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
        label.text  = seq
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Push", style: .plain, target: self, action: #selector(nextPush))
    }
    @objc
    func nextPush() {
        let vc = Code2()
        vc.seq = "2"
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

class Code2: UIViewController {
    var seq: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let label = UILabel()
        view.addSubview(label)
        label.textColor = UIColor.blue
        label.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
        label.text  = seq
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Present", style: .plain, target: self, action: #selector(nextPresent))
        
        let unwindButton = UIButton(type: .system)
        view.addSubview(unwindButton)
        unwindButton.setTitle("Unwind", for: .normal)
        unwindButton.frame = CGRect(x: 50, y: 200, width: 100, height: 50)
        unwindButton.addTarget(self, action: #selector(clicksUnwind), for: .touchUpInside)
        
    }
    @objc
    func clicksUnwind() {
//        hero.unwindToRootViewController()
        hero.unwindToViewController(withClass: Code1.self)
    }
    @objc
    func nextPresent() {
        let vc = Code2()
        vc.seq = "3"
        self.present(vc, animated: true)
    }
}
