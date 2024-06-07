//
//  UserViewController.swift
//  AnaKochievi_Assignment27
//
//  Created by MacBook on 06.06.24.
//

import UIKit
import SnapKit

class UserViewController: UIViewController {
    
    private lazy var logoutButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "Logout"), for: .normal)
        view.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.backgroundColor = UIColor(hex: "FFFFFF")
        view.dataSource = self
        view.delegate = self
        view.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        return view
    }()
    
    private let headerView: HeaderView = {
        let view = HeaderView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
        setUpConstraints()
        loadCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private var customCell: [UserData] = []
    
    private func setUp() {
        view.addSubview(tableView)
        view.addSubview(headerView)
        view.addSubview(logoutButton)
    }
    
    private func setUpConstraints() {
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(44 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview()
        }
        tableView.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(224 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-212 * Constraint.yCoeff)
        }
        logoutButton.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(700 * Constraint.yCoeff)
            make.bottom.equalToSuperview().offset(-89 * Constraint.yCoeff)
            make.centerX.equalToSuperview()
        }

    }
    
    private func loadCells() {
        customCell = [
            UserData(iconImage: UIImage(named: "Profile")!, cellLabel: "My Profile"),
            UserData(iconImage: UIImage(named: "Schedule")!, cellLabel: "Schedule"),
            UserData(iconImage: UIImage(named: "Statistics")!, cellLabel: "Statistics"),
            UserData(iconImage: UIImage(named: "Location")!, cellLabel: "Discover Combat"),
            UserData(iconImage: UIImage(named: "Chat")!, cellLabel: "Chat"),
            UserData(iconImage: UIImage(named: "Language")!, cellLabel: "Change Language"),
            UserData(iconImage: UIImage(named: "Skin")!, cellLabel: "Change App Skin")
        ]
        tableView.reloadData()
    }
    
    @objc private func logoutButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        let cellData = customCell[indexPath.row]
        cell.configureCellData(with: cellData)
        return cell
    }
    
}

extension UserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
