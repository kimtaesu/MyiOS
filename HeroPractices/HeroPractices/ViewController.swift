//
//  ViewController.swift
//  HeroPractices
//
//  Created by tskim on 24/03/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import UIKit
import Hero

class ViewController: UIViewController {
    private let colors = [UIColor.red, UIColor.cyan, UIColor.orange, UIColor.green, UIColor.magenta, UIColor.yellow]
    @IBOutlet weak var presentSegment: UISegmentedControl!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    
    private var selectedRow: Int?
    private var pickerItem: [Int: (String, HeroDefaultAnimationType)] = [
        0: ("zoom", .zoom),
        1: ("zoomOut", .zoomOut),
        2: ("page down", .pageIn(direction: .down)),
        3: ("pull down", .pull(direction: .down)),
        4: ("slide down", .slide(direction: .down))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        self.navigationController?.hero.isEnabled = true
    }

    @IBAction func go(_ sender: Any) {
        let vc = UIViewController()
        vc.hero.isEnabled = true
        vc.hero.modalAnimationType = pickerItem[self.selectedRow ?? 0]?.1 ?? HeroDefaultAnimationType.fade
        vc.view.backgroundColor = colors.randomElement()
        self.show(vc, sender: nil)
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        if let target = storyBoard.instantiateInitialViewController() {
//            target.hero.isEnabled = true
//
//            target.hero.modalAnimationType = pickerItem[self.selectedRow ?? 0]?.1 ?? HeroDefaultAnimationType.fade
//            target.view.backgroundColor = colors.randomElement()
//            self.show(target, sender: nil)
//        } else {
//            fatalError()
//        }
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerItem.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerItem[row]?.0
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedRow = row
    }
}


