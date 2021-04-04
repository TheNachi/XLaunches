//
//  RocketService.swift
//  XLaunches
//
//  Created by Munachimso Ugorji on 04/04/2021.
//

import Foundation
import RxSwift

protocol RocketServiceProtocol {
    func fetchRocket(with id: String) -> Observable<RocketModel>
}

class RocketService: RocketServiceProtocol {
    private let rocketsURL = "https://api.spacexdata.com/v4/rockets/"
    
    
    func fetchRocket(with id: String) -> Observable<RocketModel> {
        return Observable.create { (observer) -> Disposable in
            if let url = URL(string: self.rocketsURL + id) {
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
                        let rocket = try JSONDecoder().decode(RocketModel.self, from: data)
                        observer.onNext(rocket)
                    } catch {
                        observer.onError(error)
                    }
                }
                task.resume()
            }
            return Disposables.create{}
        }
    }
    
    
}
