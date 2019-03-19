//
//  SampleListReactorTest.swift
//  UnitTestPracticalTests
//
//  Created by tskim on 19/03/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Nimble
import Quick
import RxExpect
import RxSwift
import RxTest
@testable import UnitTestPractical

class SampleListReactorTest: QuickSpec {
    override func spec() {
        var reactor: SampleListReactor!
        var repository: SampleRepository!
        beforeEach {
            repository = SampleRepository()
            reactor = SampleListReactor(repository)
        }
        describe("asd") {
            it("asd", closure: {
                
                let test = RxExpect()
                let reactor = test.retain(reactor)
                test.input(reactor.action, [
                    next(200, .search("a"))
                    ])
                
                let expectSection = [MySection(header: "Items", items: repository.expect.map { $0.title })]
                test.assert(reactor.state) { events in
                    expect(events.elements.count) == 2
                    expect(events.elements[0].items) == []
                    expect(events.elements[1].items) == expectSection
                }
            })
        }
    }
}

