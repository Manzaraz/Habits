//
//  HabitCollectionViewController.swift
//  Habits
//
//  Created by Christian Manzaraz on 27/07/2023.
//

import UIKit

private let reuseIdentifier = "Cell"

class HabitCollectionViewController: UICollectionViewController {
    
    // Keep trak of async task so they can be cancelled when appropiate
    var habitsRequestTask: Task<Void, Never>? = nil
    deinit { habitsRequestTask?.cancel() }
    
    
    typealias DataSourceType = UICollectionViewDiffableDataSource<ViewModel.Section, ViewModel.Item>
    
    enum ViewModel {
        enum Section: Hashable, Comparable {
            case favorites
            case category(_ category: Category)
            
            static func < (lhs: Section, rhs: Section) -> Bool {
                switch (lhs, rhs) {
                case (.category(let l), .category(let r)):
                    return l.name < r.name
                case (.favorites, _):
                    return true
                case (_, .favorites):
                    return false
                }
            }
        }
        typealias Item = Habit
    }

    struct Model {
        var habitsByName = [String: Habit]()
        var favoriteHabits: [Habit] {
            return Settings.shared.favoriteHabits
        }
    }
    
    var dataSource: DataSourceType!
    var model = Model()    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    
    func update() {
        habitsRequestTask?.cancel()
        habitsRequestTask = Task {
            if let habits = try? await HabitRequest().send() {
                self.model.habitsByName = habits
            } else {
                self.model.habitsByName = [:]
            }
            self.updateCollectionView()
            
            habitsRequestTask = nil
        }
    }
    
    func updateCollectionView() {
        let itemsBySeciton = model.habitsByName.values.reduce(into: [ViewModel.Section: [ViewModel.Item]]()) { partial, habit in
            let item = habit
            
            let section: ViewModel.Section
            if model.favoriteHabits.contains(habit) {
                section = .favorites
            } else {
                section = .category(habit.category)
            }
            
            partial[section, default:  []].append(item)
        }
        
        let sectionIDs = itemsBySeciton.keys.sorted()
        dataSource.applySnapshotUsing(sectionIDs: sectionIDs, itemsBySection: itemsBySeciton)
    }

}
