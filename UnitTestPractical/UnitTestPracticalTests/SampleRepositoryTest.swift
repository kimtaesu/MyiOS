//
//  tddTests.swift
//  tddTests
//
//  Created by tskim on 18/03/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Quick
import Nimble
@testable import UnitTestPractical

class SampleRepositoryTest: QuickSpec {
    override func spec() {
        var repository: SampleRepository!
        
        beforeEach {
            repository = SampleRepository()
        }
        
        describe("SampleRepositoryTest") {
            it("Repository 비지니스 로직 검증") {
                let result = repository.search("a")
                expect(result).to(equal(repository.expect))
            }
        }
    }
}

