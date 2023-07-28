//
//  Habit.swift
//  Habits
//
//  Created by Christian Manzaraz on 27/07/2023.
//

import Foundation

struct Habit {
    let name: String
    let category: Category
    let info: String
}

extension Habit: Codable {
    
}
