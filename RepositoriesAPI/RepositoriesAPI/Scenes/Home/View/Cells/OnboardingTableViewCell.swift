//
//  OnboardingTableViewCell.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 30/05/20.
//

import UIKit

class OnboardingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var startButton: UIButton!
    var didGetData: (() -> ())?

    override func awakeFromNib() {
        super.awakeFromNib()
        startButton.backgroundColor = .systemIndigo
        startButton.layer.cornerRadius = 5
        startButton.layer.borderWidth = 1
        startButton.layer.borderColor = UIColor.black.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func getStartedPressed(_ sender: Any) {
        didGetData?()
    }
    
}
