//
//  HabitStatistics.swift
//  Habits
//
//  Created by Christian Manzaraz on 02/08/2023.
//

import Foundation

struct HabitStatistics {
    let habit: Habit
    let userCounts: [UserCount]
}


extension HabitStatistics: Codable {
    
}
