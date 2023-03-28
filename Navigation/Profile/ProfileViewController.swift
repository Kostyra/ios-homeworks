//
//  ProfileViewController.swift
//  Navigation
//
//  Created by  Konstantin Filippov on 08.03.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    
    
//     var profileHeaderView: ProfileHeaderView = {
//        let profileHeaderView = ProfileHeaderView()
//        profileHeaderView.backgroundColor = .lightGray
//        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
//
//        return profileHeaderView
//    }()
    private let tableView: UITableView = {
        let tableView = UITableView.init(
            frame: .zero,
            style: .plain
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        return tableView
        
    }()
    
    private func tableViewCell() {
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        
    }
    
    private func headerView() {
        let headerView = ProfileHeaderView()
        tableView.setAndLayout(headerView: headerView)
        tableView.tableFooterView = UIView()
    }
    
    
    private func table() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo:view.topAnchor),
           // tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
           // tableView.topAnchor.constraint(equalTo: profileHeaderView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 //       view.addSubview(profileHeaderView)
        table()
        tableViewCell()
        headerView()
        view.backgroundColor = UIColor(named: "Color")
    }
   
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//
//        NSLayoutConstraint.activate([
//            profileHeaderView.topAnchor.constraint(equalTo:view.topAnchor),
//            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//
//        ])
//
//    }
}


extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath)
                as? PostTableViewCell else { return UITableViewCell() }
        let arrayNew = arrayTable[indexPath.row]
        cell.tableItem(with: arrayNew)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return UITableView.automaticDimension
    }

}
