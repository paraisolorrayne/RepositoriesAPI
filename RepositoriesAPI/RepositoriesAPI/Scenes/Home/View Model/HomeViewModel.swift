//  
//  HomeViewModel.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 29/05/20.
//

import Foundation

class HomeViewModel {

    private let service: HomeServiceProtocol

    var model: [Repositories] = [Repositories]() {
        didSet {
            self.count = self.model.count
        }
    }
    /// Count your data in model
    var count: Int = 0
    /// Control page result
    private var totalPages = 0
    private var currentPage = 1

    //MARK: -- Network checking

    /// Define networkStatus for check network connection
    var networkStatus = Reach().connectionStatus()

    /// Define boolean for internet status, call when network disconnected
    var isDisconnected: Bool = false {
        didSet {
            self.alertMessage = "No network connection. Please connect to the internet"
            self.internetConnectionStatus?()
        }
    }

    //MARK: -- UI Status

    /// Update the loading status, use HUD or Activity Indicator UI
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }

    /// Showing alert message, use UIAlertController or other Library
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }

    /// Define selected model
    var selectedObject: Repositories?

    //MARK: -- Closure Collection
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var internetConnectionStatus: (() -> ())?
    var serverErrorStatus: (() -> ())?
    var didGetData: (() -> ())?

    init(withHome serviceProtocol: HomeServiceProtocol = HomeService(client: HttpClient()) ) {
        self.service = serviceProtocol

        NotificationCenter.default.addObserver(self, selector: #selector(self.networkStatusChanged(_:)), name: NSNotification.Name(rawValue: ReachabilityStatusChangedNotification), object: nil)
        Reach().monitorReachabilityChanges()

    }

    //MARK: Internet monitor status
    @objc func networkStatusChanged(_ notification: Notification) {
        self.networkStatus = Reach().connectionStatus()
    }

    
    func load() {
        switch networkStatus {
        case .offline:
            self.isDisconnected = true
            self.internetConnectionStatus?()
        case .online:
            print("online")
            self.service.getSwiftRepositories(page: currentPage) { [weak self] (result) in
                switch result {
                    case let .success(repositories):
                        self?.isLoading = false
                        self?.model = [repositories]
                        self?.didGetData?()
                    case let .failure(error):
                        print(error)
                }
            }
            // call your service here
//            self.service.removeThisFuncName(success: { data in
//
//                self.isLoading = false
//                // self.model = data
//                self.didGetData?()
//
//            }) { errorMsg, errorCode in
//                if errorCode == 0 {
//                    self.serverErrorStatus?()
//                } else {
//                    self.isLoading = false
//                    self.alertMessage = errorMsg
//                }
//            }
        default:
            break
        }
    }

}
