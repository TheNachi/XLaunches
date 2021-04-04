//
//  RocketViewController.swift
//  XLaunches
//
//  Created by Munachimso Ugorji on 04/04/2021.
//

import UIKit
import RxSwift

class RocketViewController: UIViewController {
    @IBOutlet weak var rocketImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var wikiLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var viewModel: RocketViewModel?
    var rocketId: String!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = RocketViewModel()
        self.title = viewModel?.title
        self.bindViewModel()
    }
    
    func bindViewModel() {
        guard let id = rocketId else { return }
        viewModel?.fetchRocketModel(with: id)
        
        viewModel?.driveRocket(onNext: { (rocket) in
            if let url = URL(string: rocket.flickr_images[0]) {
                self.rocketImageView.load(url: url)
            }
            self.nameLabel.text = rocket.name
            self.descriptionLabel.text = rocket.description
            self.wikiLabel.text = rocket.wikipedia
        })
    }
    
}
