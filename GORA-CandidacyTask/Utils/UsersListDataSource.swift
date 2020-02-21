//
//  UsersListDataSource.swift
//  GORA-CandidacyTask
//
//  Created by Eugene Ilyin on 22.02.2020.
//  Copyright © 2020 Eugene Ilyin. All rights reserved.
//

import Foundation
import UIKit

class UsersListDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Properties
    var users: [User]
    
    // MARK: - Initialization
    init(users: [User]) {
        self.users = users
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.name
        
        return cell
    }
}
