//
//  CombinedStatistics.swift
//  Habits
//
//  Created by Christian Manzaraz on 06/08/2023.
//

import Foundation

struct CombinedStatistics {
    let userStatistics: [UserStatistics]
    let habitStatistics: [HabitStatistics]
}

extension CombinedStatistics: Codable { }
