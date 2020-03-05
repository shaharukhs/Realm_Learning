//
//  UsersSceneDIContainer.swift
//  Realm_Learning
//
//  Created by Neosoft on 03/03/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import Foundation
import UIKit

final class UsersSceneDIContainer {
    
    // MARK: - Movies List
    func makeUsersListViewController() -> UIViewController {
        return UserListViewController.create(with: makeUsersListViewModel())
    }
    
    func makeUsersListViewModel() -> UserListViewModel {
        return DefaultUserListViewModel()
    }
    
}
