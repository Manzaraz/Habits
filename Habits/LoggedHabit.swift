//
//  LoggedHabit.swift
//  Habits
//
//  Created by Christian Manzaraz on 05/08/2023.
//

import Foundation

struct LoggedHabit {
    let userID: String
    let habitName: String
    let timesStamp: Date
}

extension LoggedHabit: Codable {  }


