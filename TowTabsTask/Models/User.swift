//
//  User.swift
//  TowTabsTask
//
//  Created by Abdulla Alsahli on 29/04/1443 AH.
//

import Foundation

// MARK: - User
struct User: Codable {
    let username, name: String?
    let profileImage: ProfileImage?
    

    enum CodingKeys: String, CodingKey {
        case username, name
        case profileImage = "profile_image"
    }
}


