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
    }
    
    //MARK: Public Functions
    func configure(item: RepositoriesItems) {
        self.shadowView?.layer.cornerRadius = 16
        self.repositoryName?.text = item.name
        self.repositoryStars?.text = item.stars.description
        self.ownerName?.text = item.owner.ownerName
        self.ownerImage?.layer.cornerRadius = 12
        self.ownerImage?.loadImage(fromString: item.owner.ownerImage, withPlaceholder: #imageLiteral(resourceName: "not-found"))
    }
}
