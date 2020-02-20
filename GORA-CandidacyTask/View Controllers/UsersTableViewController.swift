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
    private var users:[User]? {
        didSet {
            DispatchQueue.main.async {
                if self.isViewLoaded {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Users"
        
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
                        print("Got \(users.count) users")
                        self?.users = users
                    }
                }
            }
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        
        guard let users = users else { return cell }
        let user = users[indexPath.row]
        
        DispatchQueue.main.async {
            cell.textLabel?.text = user.name
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowUserPhotosSegue" {
            if let destinationVC = segue.destination as? UserPhotosTableViewController {
                guard let indexPath = self.tableView.indexPathForSelectedRow else { return }
                destinationVC.userId = users?[indexPath.row].id
            }
        }
    }

}
