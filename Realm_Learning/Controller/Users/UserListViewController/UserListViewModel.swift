//
//  UserListViewModel.swift
//  Realm_Learning
//
//  Created by Neosoft on 02/03/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import Foundation


protocol MoviesListViewModelInput {
    func viewDidLoad()
    func didLoadNextPage()
    func didSearch(query: String)
    func didSelect(item: UsersData)
}

protocol UserListViewModel: MoviesListViewModelInput {
    
}

final class DefaultUserListViewModel: UserListViewModel {
    
    private(set) var currentPage: Int = 0
    private var totalPageCount: Int = 1
    
    @discardableResult
    init() { }
    
    var hasMorePages: Bool {
        return currentPage < totalPageCount
    }
    
    var nextPage: Int {
        guard hasMorePages else { return currentPage }
        return currentPage + 1
    }
    
    let items: Observable<[UsersData]> = Observable([])
    var isEmpty: Bool { return items.value.isEmpty }
    
    private func appendPage(userData: UsersResponseModel) {
        self.currentPage = userData.page ?? 0
        self.totalPageCount = userData.totalPages ?? 1
        self.items.value = items.value + userData.data.map { $0 }!
        
        print("UserData Start")
        print(userData)
        print("UserData End")
    }
    
    private func resetPages() {
        currentPage = 0
        totalPageCount = 1
        items.value.removeAll()
    }
    
    private func load(userQuery: RequestQueryModel) {
        UsersClient.shared.getUsersList(queries: userQuery, completion: {
            [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let responseObj):
                if let responseObj = responseObj {
                    strongSelf.appendPage(userData: responseObj)
                }
                
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    //                    loadingNotification.hide(animated: true)
                }
            }
        })
    }
    
    private func update(userQuery: RequestQueryModel) {
        resetPages()
//        load(userQuery: userQuery, loadingType: .fullScreen)
        load(userQuery: userQuery)
    }
}

// MARK: - INPUT. View event methods
extension DefaultUserListViewModel {
    func viewDidLoad() {
        
    }
    
    func didLoadNextPage() {
        
    }
    
    func didSearch(query: String) {
        guard !query.isEmpty else { return }
        var queries: RequestQueryModel = []
        let query1 = RequestQueryModelElement(name: "page", value: "1")
        queries.append(query1)
        update(userQuery: queries)
    }
    
    func didSelect(item: UsersData) {
        
    }
}
