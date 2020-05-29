//
//  HomeViewTableViewCell.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 29/05/20.
//

import UIKit

class HomeViewTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var shadowView: UIView?
    @IBOutlet weak var repositoryName: UILabel?
    @IBOutlet weak var ownerName: UILabel?
    @IBOutlet weak var repositoryStars: UILabel?
    @IBOutlet weak var ownerImage: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    //MARK: Public Functions
    func configure(item: RepositoriesItems) {
        self.repositoryName?.text = item.name
        self.repositoryStars?.text = item.stars.description
        self.ownerName?.text = item.owner.ownerName
        self.ownerImage?.loadImage(fromString: item.owner.ownerImage, withPlaceholder: #imageLiteral(resourceName: "EmptyState"))
    }
    
    //MARK: - Private Functions
    private func setupView() {
        shadowView?.layer.cornerRadius = 4
        shadowView?.layer.shadowOpacity = 0.1
        shadowView?.layer.shadowOffset = CGSize(width: 0, height: 0)
        shadowView?.layer.shadowRadius = 8
        shadowView?.layer.shadowColor = UIColor.black.cgColor
        shadowView?.layer.masksToBounds = false
        
        ownerImage?.layer.cornerRadius = 8
    }
    
}
