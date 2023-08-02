//
//  UserCollectionViewController.swift
//  Habits
//
//  Created by Christian Manzaraz on 27/07/2023.
//

import UIKit

class UserCollectionViewController: UICollectionViewController {

    typealias DataSourceType = UICollectionViewDiffableDataSource<ViewModel.Section, ViewModel.Item>
    
    enum ViewModel {
        typealias Item = Int
        
        struct Item: Hashable {
            let user: User
            let isFollowed: Bool
            
            func hash(into hasher: inout Hasher) {
                hasher.combine(user)
            }
            
            static func == (_ lhs: Item, _ rhs: Item) -> Bool {
                return lhs.user == rhs.user
            }
        }
    }
    
    struct Model {
        var usersByID = [String: User]()
        var followedUsers: [User] {
            return Array(usersByID.filter {
                Settings.shared.followedUserIDs.contains($0.key)
            }.values)
        }
    }
    
    var dataSource: DataSourceType!
    var model = Model()    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }



}
