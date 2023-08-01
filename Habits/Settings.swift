//
//  Settings.swift
//  Habits
//
//  Created by Christian Manzaraz on 01/08/2023.
//

import Foundation


enum Settings {
    static let favoriteHabits = "favoriteHabits"
    
}

struct Settings {
    static var shared = Settings()
    
    private let defaults = UserDefaults.standard
    
    private func archiveJSON<T: Encodable>(value: T, key: String) {
        let data = try! JSONEncoder().encode(value)
        let string = String(data: data, encoding: .utf8)
        defaults.set(string, forKey: key)
    }
    
    private func unarchiveJSON<T: Decodable>(key: String) -> T? {
        guard
            let string = defaults.string(forKey: key),
            let data = string.data(using: .utf8)
        else { return nil }
        
        return try! JSONDecoder().decode(T.self, from: data)
    }
    
    var favoriteHabits: [Habit] {
        get {
            return unarchiveJSON(key: Settings.favoriteHabits) ?? []
        }
        set {
            archiveJSON(value: newValue, key: Settings.favoriteHabits)
        }
    }
    
}
