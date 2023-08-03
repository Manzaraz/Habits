//
//  HabitDetailViewController.swift
//  Habits
//
//  Created by Christian Manzaraz on 27/07/2023.
//

import UIKit

class HabitDetailViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    
    
    typealias DataSourceType = UICollectionViewDiffableDataSource<ViewModel.Section, ViewModel.Item>
    
    enum ViewModel {
        enum Section: Hashable {
            case leaders (count: Int)
            case remaining
        }
        
        enum Item: Hashable, Comparable {
            case single (_ stat: UserCount)
            case multiple (_ stat: [UserCount])
            
            static func < (_ lhs: Item, rhs: Item) -> Bool {
                switch (lhs, rhs) {
                case (.single(let lCount), .single(let rCount)):
                    return lCount.count < rCount.count
                case (.multiple(let lCounts), .multiple(let rCount) ):
                    return lCounts.first!.count < rCount.first!.count
                case (.single, .multiple):
                    return false
                case (.multiple, .single):
                    return true
                }
            }
        }
    }
    
    struct Model {
        var habitStatistics: HabitStatistics?
        var userCounts: [UserCount] {
            habitStatistics?.userCounts ?? []
        }
    }
    
    var dataSource: DataSourceType!
    var model = Model()
        
    var habit: Habit!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init?(coder: NSCoder, habit: Habit) {
        self.habit = habit
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = habit.name
        categoryLabel.text = habit.category.name
        infoLabel.text = habit.info
        
    }


}
