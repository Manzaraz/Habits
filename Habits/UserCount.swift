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
    
}

extension UserCount: Hashable {
    
}
