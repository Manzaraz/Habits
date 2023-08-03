//
//  UserStatistics.swift
//  Habits
//
//  Created by Christian Manzaraz on 03/08/2023.
//

import Foundation

struct UserStatistics {
    let user: User
    let habitCounts: [HabitCount]
}


extension UserStatistics: Codable {  }
