//
//  ViewController.swift
//  XLaunches
//
//  Created by Munachimso Ugorji on 04/04/2021.
//

import UIKit
import RxSwift
import RxCocoa

class LaunchesViewController: UIViewController {
    @IBOutlet weak var launchesTableView: UITableView!
    private var viewModel: LaunchesTableViewModel?
    let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = LaunchesTableViewModel()
        self.title = viewModel?.title
        self.setupTableView()
        launchesTableView.tableFooterView = UIView()
    }
    
    func setupTableView() {
        viewModel?.fetchLaunchViewModel()
            .observe(on: MainScheduler.instance)
            .bind(to: launchesTableView.rx.items(cellIdentifier: LaunchesTableViewCell.identifier)) { index, viewModel, cell  in
                if let launchCell = cell as? LaunchesTableViewCell {
                    launchCell.bindViewModel(with: viewModel)
                }
            }.disposed(by: disposeBag)
        
        
        launchesTableView.rx
            .modelSelected(LaunchViewModel.self)
            .asDriver()
            .drive(onNext: { selected in
                let rocketVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "rocketVC") as! RocketViewController
                rocketVC.rocketId = selected.rocketId
                self.navigationController?.pushViewController(rocketVC, animated: true)
                
            }).disposed(by: disposeBag)
        
        launchesTableView.rx.setDelegate(self).disposed(by: disposeBag)
    }
}

extension LaunchesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 375
    }
}
