//
//  User.swift
//  Habits
//
//  Created by Christian Manzaraz on 01/08/2023.
//

import Foundation

struct User {
    let id: String
    let name: String
    let color: Color?
    let bio: String?
}


extension User: Codable { }

extension User: Hashable {
    func hash(into hasher: inout Hasher)  {
        hasher.combine(id)
    }
    
    static func  == (_ lhs: User, _ rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}

extension User: Comparable {
    static func < (lhs: User, rhs: User) -> Bool {
        return lhs.name < rhs.name
    }
}
