//  
//  HomeView.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 29/05/20.
//

import UIKit

class HomeView: UIViewController {

    // OUTLETS HERE
    @IBOutlet weak var tableView: UITableView!
    // VARIABLES HERE
    var viewModel = HomeViewModel()
    private let coordinator: CoordinatorProtocol
    var safeArea: UILayoutGuide!
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
        super.init(nibName: String(describing: HomeView.self),
                   bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
    }
    
    fileprivate func setupViewModel() {

        self.viewModel.showAlertClosure = {
            let alert = self.viewModel.alertMessage ?? ""
            print(alert)
        }
        
        self.viewModel.updateLoadingStatus = {
            if self.viewModel.isLoading {
                print("LOADING...")
            } else {
                 print("DATA READY")
            }
        }

        self.viewModel.internetConnectionStatus = {
            print("Internet disconnected")
            // show UI Internet is disconnected
        }

        self.viewModel.serverErrorStatus = {
            print("Server Error / Unknown Error")
            // show UI Server is Error
        }

        self.viewModel.didGetData = {
            // update UI after get data
        }

    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        safeArea = view.layoutMarginsGuide
        let nib = UINib(nibName: "HomeViewTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "\(HomeViewTableViewCell.self)")
        let nibEmpty = UINib(nibName: "EmptyTableViewCell", bundle: nil)
        tableView.register(nibEmpty, forCellReuseIdentifier: "\(EmptyTableViewCell.self)")
    }
}


