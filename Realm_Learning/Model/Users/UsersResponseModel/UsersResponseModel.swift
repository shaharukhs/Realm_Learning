//
//  UsersResponseModel.swift
//  Realm_Learning
//
//  Created by Neosoft on 02/03/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import Foundation

// MARK: - UsersResponseModel
struct UsersResponseModel: Codable {
    let page: Int?
    let perPage: Int?
    let total: Int?
    let totalPages: Int?
    let data: [UsersData]?

    enum CodingKeys: String, CodingKey {
        case page = "page"
        case perPage = "per_page"
        case total = "total"
        case totalPages = "total_pages"
        case data = "data"
    }
}

// MARK: - Datum
struct UsersData: Codable {
    let id: Int?
    let email: String?
    let firstName: String?
    let lastName: String?
    let avatar: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case email = "email"
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar = "avatar"
    }
}
