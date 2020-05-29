//
//  UIImageViewExtension.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 29/05/20.
//

import UIKit

extension UIImageView {
    
    func loadImage(fromString stringURL: String, withPlaceholder placeholder: UIImage?) {
        guard let url = URL(string: stringURL) else {
            image = placeholder
            return
        }
        DispatchQueue.global().async { [weak self] in
            guard let data = try? Data(contentsOf: url), let image = UIImage(data: data) else {
                DispatchQueue.main.async {
                    self?.image = placeholder
                }
                return
            }
            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
}
