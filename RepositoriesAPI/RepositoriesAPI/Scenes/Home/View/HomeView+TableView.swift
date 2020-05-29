//
//  HomeView+TableView.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 29/05/20.
//

import UIKit

extension UITableView {
    func setEmptyView() {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        self.backgroundView = emptyView
        self.separatorStyle = .none
        let cell = self.dequeueReusableCell(withIdentifier: "\(EmptyTableViewCell.self)") as! EmptyTableViewCell
        cell.frame = self.bounds
        emptyView.addSubview(cell)
    }
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}

extension HomeView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.count == 0 {
            self.tableView.setEmptyView()
        } else {
            self.tableView.restore()
        }
        return self.viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(HomeViewTableViewCell.self)") as! HomeViewTableViewCell
        guard let item = viewModel.selectedObject?.items[indexPath.row]  else {
            let blank = RepositoriesItems(name: "", stars: 0, owner: RepositoriesOwners(ownerImage: "", ownerName: ""))
            cell.configure(item: blank)
            return cell
        }
        cell.configure(item: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
