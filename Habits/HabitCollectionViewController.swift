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
        enum Section: Hashable {
            case favorites
            case category(_ category: Category)
        }
        typealias Item = Habit
    }

    struct Model {
        var habitsByName = [String: Habit]()
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
            
            habitRequestTask = nil
        }
    }
    
    func updateCollectionView() {
        
    }



}
