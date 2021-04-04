//
//  LaunchService.swift
//  XLaunches
//
//  Created by Munachimso Ugorji on 04/04/2021.
//

import Foundation
import RxSwift

protocol LaunchServiceProtocol {
    func fetchLaunch() -> Observable<[LaunchModel]>
}

class LaunchService: LaunchServiceProtocol {
    private let launchURL = "https://api.spacexdata.com/v4/launches"
    
    func fetchLaunch() -> Observable<[LaunchModel]> {
        return Observable.create { (observer) -> Disposable in
            if let url = URL(string: self.launchURL) {
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { (data, response, error) in
                    
                    if error != nil {
                        observer.onError(error!)
                    }
                    
                    guard let data = data else {
                        observer.onError(NSError())
                        return
                    }
                    
                    do {
                        let launch = try JSONDecoder().decode([LaunchModel].self, from: data)
                        observer.onNext(launch)
                    } catch {
                        observer.onError(error)
                    }
                }
                task.resume()
            }
            return Disposables.create {}

        }
    }
}
