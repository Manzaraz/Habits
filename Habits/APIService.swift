//
//  APIService.swift
//  Habits
//
//  Created by Christian Manzaraz on 27/07/2023.
//

import Foundation

struct HabitRequest: APIRequest {    
    typealias Response = [String: Habit]
    
    var habitName: String?
    
    var path: String { "/habits" }
}
