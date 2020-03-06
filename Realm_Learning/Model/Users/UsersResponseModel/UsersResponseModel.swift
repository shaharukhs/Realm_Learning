//
//  UsersResponseModel.swift
//  Realm_Learning
//
//  Created by Neosoft on 02/03/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: - UsersResponseModel
//struct UsersResponseModel: Codable {
//    let page: Int?
//    let perPage: Int?
//    let total: Int?
//    let totalPages: Int?
//    let data: [UsersData]?
//
//    enum CodingKeys: String, CodingKey {
//        case page = "page"
//        case perPage = "per_page"
//        case total = "total"
//        case totalPages = "total_pages"
//        case data = "data"
//    }
//}

// MARK: - Datum
//struct UsersData: Codable {
//    let id: Int?
//    let email: String?
//    let firstName: String?
//    let lastName: String?
//    let avatar: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case email = "email"
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case avatar = "avatar"
//    }
//}

@objcMembers class UsersResponseModel: Object, Codable {
//    dynamic var id: String = ""
    dynamic var page: Int?
    dynamic var perPage: Int?
    dynamic var total: Int?
    dynamic var totalPages: Int?
    let data = List<UsersData>()
    
    enum CodingKeys: String, CodingKey {
//        case id
        case page = "page"
        case perPage = "per_page"
        case total = "total"
        case totalPages = "total_pages"
        case data = "data"
    }
    
}

@objcMembers class UsersData: Object, Codable {
//    dynamic var id: String = ""
    dynamic var id: Int?
    dynamic var email: String?
    dynamic var firstName: String?
    dynamic var lastName: String?
    dynamic var avatar: String?
    
    enum CodingKeys: String, CodingKey {
//        case id
        case id = "id"
        case email = "email"
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar = "avatar"
    }
    
}

extension List: Decodable where Element: Decodable {
    public convenience init(from decoder: Decoder) throws {
        self.init()
        var container = try decoder.unkeyedContainer()
        while !container.isAtEnd {
            let element = try container.decode(Element.self)
            self.append(element)
        }
    }
}

extension List: Encodable where Element: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        for element in self {
            try element.encode(to: container.superEncoder())
        }
    }
}
