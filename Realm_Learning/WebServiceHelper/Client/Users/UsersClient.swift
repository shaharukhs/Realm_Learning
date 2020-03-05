//
//  UsersClient.swift
//  Realm_Learning
//
//  Created by Neosoft on 02/03/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import Foundation
import UIKit

class UsersClient: RequestClient {
    static let shared = UsersClient()
    
    /// getCurrentLocationWeather
//    func getCurrentLocationWeather(query: String = "", withStatusCode statusCode: Int = 200, vc: UIViewController, completion: @escaping (Result<CurrentWeather?, APIError>) -> ()) {
//        if Reachability.isConnectedToNetwork() {
//            guard let request = WeatherAPI.weather.requestWithQuery(query: query) else { return }
//
//            print("Request URL :: ", request.url?.absoluteString ?? "Some thing went wrong")
//            self.fetch(with: request, withStatusCode: statusCode , decode: { json -> CurrentWeather? in
//                guard let results = json as? CurrentWeather else { return  nil }
//                return results
//            }, completion: completion)
//        } else {
//            print("Not reachable")
//            Alert.showNoInternetConnection(on: vc)
//        }
//    }
    
    //MARK:- verification OTP code
    func getUsersList(queries: RequestQueryModel, completion: @escaping (Result<UsersResponseModel?, APIError>) -> ()) {
        
//        if Reachability.isConnectedToNetwork() {
        guard let request = Reqres.listUsers.requestWithQuery(queries: queries) else { return }
            
            fetch(with: request, decode: { json -> UsersResponseModel? in
                guard let results = json as? UsersResponseModel else { return  nil }
                return results
            }, completion: completion)
//        } else {
//            print("Not reachable")
//            Alert.showNoInternetConnection(on: vc)
//        }
    }
}
