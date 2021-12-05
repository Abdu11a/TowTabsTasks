//
//  UserListViewModel.swift
//  TowTabsTask
//
//  Created by Abdulla Alsahli on 01/05/1443 AH.
//

import Foundation

struct UserListViewModel {
    var users : Observable<[UserTableViewCellViewModel]> = Observable([])
}
