//
// Created by Alisultan Abdullah on 10.05.2022.
//

import Foundation


class ExploreViewModel:ObservableObject {
    let service = UserService()
    @Published var users = [User]()
    @Published var searchText = ""
    var searchableUsers: [User] {
        if (searchText.isEmpty) {
            return users
        } else {
            let lowercasedQuery = searchText.lowercased()
            return users.filter({
                $0.username.lowercased().contains(lowercasedQuery) ||
                $0.fullName.lowercased().contains(lowercasedQuery)
            })
        }
    }
    

    init() {
        fetchUsers()
    }

    func fetchUsers() {
        service.fetchUsers { [weak self] users in
            self?.users = users
        }
    }
}
