//
//  HabitCollectionViewController.swift
//  Habits
//
//  Created by Christian Manzaraz on 27/07/2023.
//

import UIKit

private let reuseIdentifier = "Cell"

class HabitCollectionViewController: UICollectionViewController {
    
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




}
