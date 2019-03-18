//
//  ViewController.swift
//  HidingNavigationBar
//
//  Created by tskim on 17/03/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    private let webView = WKWebView()
//    private let textField = UITextField.init(frame: CGRect.init(x: 50, y: 100, width: 300, height: 100))
    override func viewDidLoad() {
        super.viewDidLoad()
//        textField.placeholder = "여기 클릭해주세요."
//        view.addSubview(textField)
//        view.backgroundColor = UIColor.white
        view = webView
        let url = URL(string: "https://www.google.co.kr/")
        let request = URLRequest(url: url!)
        webView.load(request)
        
//        navigationController?.hidesBarsOnSwipe = true
//        navigationController?.hidesBarsOnTap = true
//        navigationController?.hidesBarsWhenKeyboardAppears = true
        navigationController?.hidesBarsWhenVerticallyCompact = true
    }
}

