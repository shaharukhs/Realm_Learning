//
//  RequestQueryModel.swift
//  Realm_Learning
//
//  Created by Neosoft on 02/03/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import Foundation

// MARK: - RequestQueryModelElement
struct RequestQueryModelElement: Codable {
    let name: String?
    let value: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
    }
}

typealias RequestQueryModel = [RequestQueryModelElement]
