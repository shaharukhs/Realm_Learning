//
//  UserListViewController.swift
//  Realm_Learning
//
//  Created by Neosoft on 02/03/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import UIKit

//https://tech.olx.com/clean-architecture-and-mvvm-on-ios-c9d167d9f5b3

class UserListViewController: UIViewController, StoryboardInstantiable {
    
    private var viewModel: UserListViewModel!
    
    static func create(with viewModel: UserListViewModel)
                             -> UserListViewController {
        let view = UserListViewController.instantiateViewController()
        view.viewModel = viewModel
//        view.moviesListViewControllersFactory = moviesListViewControllersFactory
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.didSearch(query: "Batman")
        
        // Do any additional setup after loading the view.
    }
    

}

