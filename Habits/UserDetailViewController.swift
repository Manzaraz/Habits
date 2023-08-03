//
//  UserDetailViewController.swift
//  Habits
//
//  Created by Christian Manzaraz on 27/07/2023.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var bioLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    
    var user: User!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init?(coder: NSCoder, user: User) {
        self.user = user
        super.init(coder: coder)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameLabel.text = user.name
        bioLabel.text = user.bio
        
    }
    

    

}
