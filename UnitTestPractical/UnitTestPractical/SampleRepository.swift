//
//  SampleRepository.swift
//  tdd
//
//  Created by tskim on 18/03/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation

class SampleRepository {
    
    let fixture = [
        Sample(title: "aaa"),
        Sample(title: "abb"),
        Sample(title: "acc"),
        Sample(title: "bcc")
    ]
    
    let expect: [Sample] = [
        Sample(title: "aaa"),
        Sample(title: "abb"),
        Sample(title: "acc")
    ]
    
    func search(_ keyword: String) -> [Sample] {
        return fixture.filter {  $0.title.starts(with: keyword) }
    }
}
