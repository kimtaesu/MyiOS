//
//  SampleDetailViewController.swift
//  UnitTestPractical
//
//  Created by tskim on 18/03/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import UIKit
class SampleDetailViewController: UIViewController {
    private var sampleTitle: String?
    
    private let titleView = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        titleView.do {
            view.addSubview($0)
            $0.font = $0.font.withSize(30)
            $0.text = sampleTitle
            $0.snp.makeConstraints({ make in
                make.center.equalToSuperview()
            })
        }
    }
}


extension SampleDetailViewController {
    class func createVC(_ title: String) -> SampleDetailViewController {
        return SampleDetailViewController().then {
            $0.sampleTitle = title
        }
    }
}

