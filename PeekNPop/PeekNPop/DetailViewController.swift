//
//  DetailViewController.swift
//  PeekNPop
//
//  Created by tskim on 24/03/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import UIKit

enum DetailType {
    case cat
    case dog
    case banana
}

class DetailViewController: UIViewController {

    private var iType: DetailType?

    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let type = iType {
            switch type {
            case .cat:
                imageView.image = UIImage(named: "cat")
                titleView.text = "Cat"
            case .dog:
                titleView.text = "Dog"
                imageView.image = UIImage(named: "dog")
            case .banana:
                titleView.text = "Banana"
                imageView.image = UIImage(named: "banana")
            }
        }
    }
}

extension DetailViewController {
    override var previewActionItems: [UIPreviewActionItem] {
        let single = UIPreviewAction(title:"single", style: .default) {_,_ in }
        let act1 = UIPreviewAction(title:"default", style: .default) {_,_ in }
        let act2 = UIPreviewAction(title:"selected", style: .selected)  {_,_ in }
        let act3 = UIPreviewAction(title:"destructive", style: .destructive)  {_,_ in }
        let group = UIPreviewActionGroup(title: "status", style: .default, actions: [act1, act2, act3])
        // example of selected style
        return [single, group]
    }
}
extension DetailViewController {
    class func createVC(_ type: DetailType) -> DetailViewController {
        let vc = DetailViewController()
        vc.iType = type
        return vc
    }
}
