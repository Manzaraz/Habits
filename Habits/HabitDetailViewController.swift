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
