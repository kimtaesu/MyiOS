//
//  ItemSample.swift
//  UnitTestPractical
//
//  Created by tskim on 18/03/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import UIKit
import SnapKit

class SampleItemCell: UITableViewCell, SwiftNameIdentifier {
    private let title = UILabel()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initViews()
    }

    private func initViews() {
        title.do {
            contentView.addSubview($0)
            $0.snp.makeConstraints({ make in
                make.leading.equalToSuperview()
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview()
            })
        }
    }
}

extension SampleItemCell {
    func configCell(_ item: String) {
        self.title.text = item
    }
}
