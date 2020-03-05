//
//  RequestClient.swift
//  Realm_Learning
//
//  Created by Neosoft on 02/03/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import Foundation

// https://medium.com/@jamesrochabrun/protocol-based-generic-networking-part-2-jsonencoder-and-encodable-for-post-request-in-swift-27ebd301c314

class RequestClient: GenericAPIClient {
        
    internal let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
}

//https://reqres.in/
enum Reqres {
    case listUsers
    case singleUser
    case login
    case register
}

extension Reqres: Endpoint {
    var path: String {
        switch self {
        case .listUsers: return "/users"
        case .singleUser: return "/users"
        case .login: return "/login"
        case .register: return "/register"
        }
    }
    
    var base: String {
        return "https://reqres.in/api"
    }
}
