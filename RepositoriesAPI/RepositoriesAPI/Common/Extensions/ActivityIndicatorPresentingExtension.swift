//
//  ActivityIndicatorPresentingExtension.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 30/05/20.
//

import Foundation
import UIKit

protocol ActivityIndicatorPresenting {
    func showActivityIndicator()
    func hideActivityIndicator()
}

extension ActivityIndicatorPresenting where Self: UIViewController {
    func showActivityIndicator() {
        guard !view.subviews.contains(where: { $0 is UIActivityIndicatorView }) else { return }
        let activityIndicator = UIActivityIndicatorView()
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            guard let activityIndicator = self.view.subviews.first(where: { $0 is UIActivityIndicatorView }) as? UIActivityIndicatorView else { return }
            activityIndicator.removeFromSuperview()
        }
        
    }
}
