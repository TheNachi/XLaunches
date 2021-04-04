//
//  LaunchesTableViewCell.swift
//  XLaunches
//
//  Created by Munachimso Ugorji on 04/04/2021.
//

import UIKit

class LaunchesTableViewCell: UITableViewCell {
    static let identifier = "launchesCell"
    @IBOutlet weak var patchImageView: UIImageView!
    @IBOutlet weak var upcomingLabel: UILabel!
    @IBOutlet weak var launchNumberLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var detailsTextView: UITextView!
    
    func bindViewModel(with viewModel: LaunchViewModel) {
        if let urlString = viewModel.imageString,
           let url = URL(string: urlString) {
            self.patchImageView.load(url: url)
        }
        if viewModel.upcoming {
            self.upcomingLabel.isHidden = false
        }
        self.launchNumberLabel.text = viewModel.launchNumber
        self.dateLabel.text = viewModel.date
        self.detailsTextView.text = viewModel.details
    }
    
}
