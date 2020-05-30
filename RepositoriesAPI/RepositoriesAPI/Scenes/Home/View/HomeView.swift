//  
//  HomeView.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 29/05/20.
//

import UIKit

class HomeView: UIViewController, ActivityIndicatorPresenting {

    // OUTLETS HERE
    @IBOutlet weak var tableView: UITableView!
    // VARIABLES HERE
    private let refreshControl = UIRefreshControl()
    var viewModel = HomeViewModel()
    private let coordinator: CoordinatorProtocol
    var uiState: UIState = .onboarding
    
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
        self.setupTableView()
        self.viewModel.isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { // Change `2.0` to the desired number of seconds.
            self.loadData(page: 1)
        }
        
    }
    
    fileprivate func setupViewModel() {
        self.viewModel.updateLoadingStatus = {
            if self.viewModel.isLoading {
                self.showActivityIndicator()
            } else {
                self.hideActivityIndicator()
            }
        }

        self.viewModel.internetConnectionStatus = {
            DispatchQueue.main.async {
                self.uiState = .internetConnectionStatus
                self.tableView.reloadData()
            }
        }

        self.viewModel.serverErrorStatus = {
            DispatchQueue.main.async {
                self.uiState = .serverErrorStatus
                self.tableView.reloadData()
            }
        }

        self.viewModel.didGetData = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func loadData(page: Int) {
        self.viewModel.load(language: "swift", from: page)
        self.refreshControl.endRefreshing()
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        // Configure Refresh Control
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        let homeNib = UINib(nibName: "HomeViewTableViewCell", bundle: nil)
        tableView.register(homeNib, forCellReuseIdentifier: "\(HomeViewTableViewCell.self)")
        let emptyNib = UINib(nibName: "EmptyTableViewCell", bundle: nil)
        tableView.register(emptyNib, forCellReuseIdentifier: "\(EmptyTableViewCell.self)")
        let onboardingNib = UINib(nibName: "OnboardingTableViewCell", bundle: nil)
        tableView.register(onboardingNib, forCellReuseIdentifier: "\(OnboardingTableViewCell.self)")
        let noConnectionNib = UINib(nibName: "NoConnectionTableViewCell", bundle: nil)
        tableView.register(noConnectionNib, forCellReuseIdentifier: "\(NoConnectionTableViewCell.self)")
        let serverErrorNib = UINib(nibName: "ServerErrorTableViewCell", bundle: nil)
        tableView.register(serverErrorNib, forCellReuseIdentifier: "\(ServerErrorTableViewCell.self)")
    }

    @objc private func refreshData(_ sender: Any) {
        loadData(page: 1)
    }

}
