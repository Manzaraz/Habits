//
//  UserCount.swift
//  Habits
//
//  Created by Christian Manzaraz on 02/08/2023.
//

import Foundation

struct UserCount {
    let user: User
    let count: Int
}

extension UserCount: Codable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(user)
    }
    
    static func == (_ lhs: UserCount, _ rhs: UserCount) -> Bool {
        return lhs.user == rhs.user
    }
}

extension UserCount: Hashable {
    
}
