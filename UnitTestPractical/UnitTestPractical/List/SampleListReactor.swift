//
//  SampleListReactor.swift
//  UnitTestPractical
//
//  Created by tskim on 18/03/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import ReactorKit
import RxSwift

class SampleListReactor: Reactor {
    let initialState = State(items: [])
    private let repository: SampleRepository!

    init(_ repository: SampleRepository) {
        self.repository = repository
    }

    enum Action {
        case search(String)
        case itemSelected(IndexPath)
    }

    struct State {
        var items: [MySection]

        public init(items: [MySection]) {
            self.items = items
        }
        
        var selectedTitle: String?
    }

    enum Mutation {
        case searchItems([Sample])
        case itemSelected(String)
    }

    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .itemSelected(let indexPath):
            return Observable.just(Mutation.itemSelected(currentState.items[indexPath.section].items[indexPath.row]))
        case .search(let keyword):
            return .just(.searchItems(repository.search(keyword)))
        }
    }
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = State(items: state.items)
        switch mutation {
        case .itemSelected(let title):
            newState.selectedTitle = title
        case .searchItems(let items):
            newState.items = [MySection(header: "Items", items: items.map { $0.title} )]
        }
        return newState
    }
}
