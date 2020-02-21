//
//  UsersTableViewController.swift
//  GORA-CandidacyTask
//
//  Created by Eugene Ilyin on 20.02.2020.
//  Copyright © 2020 Eugene Ilyin. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {

    // MARK: - Properties
    private let apiWorker = APIWorker.shared
    private let jsonParser = JSONParser.shared
    private var dataSource: UsersListDataSource! {
        didSet {
            DispatchQueue.main.async {
                self.tableView.dataSource = self.dataSource
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = ViewControllerTitle.users.rawValue.localized
        
        downloadAndParseUsers()
    }
    
    // MARK: - Private methods
    private func downloadAndParseUsers() {
        guard let usersURL = URLBuilder()
            .set(scheme: APIScheme.https.rawValue)
            .set(host: APIHost.default.rawValue)
            .set(path: APIPath.users.rawValue)
            .build() else { return }
        
        apiWorker.fetchData(from: usersURL) {
            [weak self] (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }

            if let response = response as? HTTPURLResponse,
                response.statusCode == 200,
                let data = data {
                self?.jsonParser.parseUsers(from: data) {
                    (users, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    }

                    if let users = users {
                        self?.dataSource = UsersListDataSource(users: users)
                    }
                }
            }
        }
    }

    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowUserPhotosSegue" {
            if let destinationVC = segue.destination as? UserPhotosTableViewController {
                guard let indexPath = self.tableView.indexPathForSelectedRow else { return }
                
                destinationVC.userId = dataSource.users[indexPath.row].id
            }
        }
    }

}
