//
//  SampleListViewController.swift
//  Nimble
//
//  Created by tskim on 18/03/2019.
//

import ReactorKit
import Then
import UIKit
import RxCocoa
import RxDataSources
import Differentiator
import RxOptional

class SampleListViewController: UIViewController {

    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = tableView
        tableView.register(SampleItemCell.self, forCellReuseIdentifier: SampleItemCell.swiftIdentifier)
    }
}

extension SampleListViewController: View, HasDisposeBag {
    func bind(reactor: SampleListReactor) {

        tableView.rx.itemSelected
            .map { Reactor.Action.itemSelected($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        reactor.action.onNext(.search("a"))

        let dataSource = RxTableViewSectionedAnimatedDataSource<MySection>(
            configureCell: { ds, tv, ip, item in
                guard let cell: SampleItemCell = tv.dequeueReusableCell(withIdentifier: SampleItemCell.swiftIdentifier) as? SampleItemCell
                    else { return UITableViewCell.init(style: .default, reuseIdentifier: "") }
                cell.configCell(item)
                return cell
            },
            titleForHeaderInSection: { ds, index in
                return ds.sectionModels[index].header
            }
        )

        reactor.state.map { $0.items }
            .filterEmpty()
            .bind(to: self.tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)

        reactor.state.map { $0.selectedTitle }
            .subscribe(onNext: { [weak self] title in
                self?.show(SampleDetailViewController.createVC(title ?? "Default"), sender: nil)
            })
            .disposed(by: disposeBag)
    }
}

extension SampleListViewController: UITableViewDelegate {
    class func createVC(_ repository: SampleRepository) -> SampleListViewController {
        return SampleListViewController().then {
            $0.reactor = SampleListReactor(repository)
        }
    }
}
