//
//  HomeView+TableView.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 29/05/20.
//

import UIKit

enum UIState {
    case emptyData
    case internetConnectionStatus
    case onboarding
    case serverErrorStatus
}

extension UITableView {
    func setEmptyView(state: UIState) {
        let stateView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        self.backgroundView = stateView
        self.separatorStyle = .none
        switch state {
            case .emptyData:
                let cell = self.dequeueReusableCell(withIdentifier: "\(EmptyTableViewCell.self)") as! EmptyTableViewCell
                cell.frame = self.bounds
                stateView.addSubview(cell)
            case .internetConnectionStatus:
                let cell = self.dequeueReusableCell(withIdentifier: "\(NoConnectionTableViewCell.self)") as! NoConnectionTableViewCell
                cell.frame = self.bounds
                stateView.addSubview(cell)
            case .onboarding:
                let cell = self.dequeueReusableCell(withIdentifier: "\(OnboardingTableViewCell.self)") as! OnboardingTableViewCell
                cell.frame = self.bounds
                stateView.addSubview(cell)
                cell.didGetData = {
                    //loadData
                }
            case .serverErrorStatus:
                let cell = self.dequeueReusableCell(withIdentifier: "\(ServerErrorTableViewCell.self)") as! ServerErrorTableViewCell
                cell.frame = self.bounds
                stateView.addSubview(cell)
        }
        
        
    }

    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}

extension HomeView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.count == 0 {
            self.tableView.setEmptyView(state: self.uiState)
        } else {
            self.tableView.restore()
        }
        return self.viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeViewTableViewCell = tableView.dequeueReusableCell(withIdentifier: "\(HomeViewTableViewCell.self)") as! HomeViewTableViewCell
        
        guard let item = viewModel.model.first?.items[indexPath.row]  else {
            let blank = RepositoriesItems(name: "", stars: 0, owner: RepositoriesOwners(ownerImage: "", ownerName: ""))
            cell.configure(item: blank)
            return cell
        }
        cell.configure(item: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
