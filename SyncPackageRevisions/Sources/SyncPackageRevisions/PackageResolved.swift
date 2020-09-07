//
//  PackageResolved.swift
//  
//
//  Created by Roman Kerimov on 2020-09-07.
//

import Foundation

struct PackageResolved: Codable {
    let object: Object
    struct Object: Codable {
        let pins: [Pin]
        struct Pin: Codable {
            let package: String
            let repositoryURL: String
            let state: State
            struct State: Codable {
                let branch: String
                let revision: String
                let version: Int?
            }
        }
    }
    let version: Int
}
