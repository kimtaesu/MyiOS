//
//  ViewController.swift
//  PeekNPop
//
//  Created by tskim on 24/03/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var catButton: UIButton!
    @IBOutlet weak var dogButton: UIButton!
    @IBOutlet weak var bananaButton: UIButton!
    
    @IBOutlet weak var container: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerForPreviewing(with: self, sourceView: view) // *
        catButton.addTarget(self, action: #selector(clicksButton), for: .touchUpInside)
        dogButton.addTarget(self, action: #selector(clicksButton), for: .touchUpInside)
        bananaButton.addTarget(self, action: #selector(clicksButton), for: .touchUpInside)
    }
    @objc
    func clicksButton(sender: UIButton) {
        let title = sender.title(for: .normal)
        let type = title?.toDetail() ?? DetailType.banana
        let vc = DetailViewController.createVC(type)
        transitionContainerTo(vc)
    }
    
    func transitionContainerTo(_ vc: UIViewController) {
        let oldvc = self.children[0]
        vc.view.frame = self.container.bounds
        self.addChild(vc)
        oldvc.willMove(toParent: nil)
        self.transition(
            from: oldvc, to: vc,
            duration: 0.2, options: .transitionCrossDissolve,
            animations: nil) { _ in
                vc.didMove(toParent: self)
                oldvc.removeFromParent()
        }
    }
}

private extension String {
    func toDetail() -> DetailType {
        switch self {
        case "Cat":
            return DetailType.cat
        case "Dog":
            return DetailType.dog
        default:
            return DetailType.banana
        }
    }
}

extension ViewController: UIViewControllerPreviewingDelegate {
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let sv = previewingContext.sourceView
        guard let button = sv.hitTest(location, with: nil) as? UIButton else {return nil}
        let title = button.title(for: .normal)
        
        let type = title?.toDetail() ?? DetailType.banana
        return DetailViewController.createVC(type)
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        self.transitionContainerTo(viewControllerToCommit)
    }
}


