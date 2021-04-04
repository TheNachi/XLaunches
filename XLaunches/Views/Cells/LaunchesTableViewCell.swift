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
    
    func bindViewModel(with viewModel: LaunchViewModel)
    
}
