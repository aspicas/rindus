//
//  WeatherProvider.swift
//  rindus
//
//  Created by David Garcia on 27/12/21.
//

import Foundation
import Moya

class WeatherProvider {
    private var weatherProvider: MoyaProvider<WeatherService>
    
    init(weatherProvider: MoyaProvider<WeatherService> =
         MoyaProvider<WeatherService>(callbackQueue: .global(qos: .background))) {
        self.weatherProvider = weatherProvider
    }
    
    func getCurrent(city: String, completion: @escaping (Result<String, Error>) -> Void) {
        weatherProvider.request(.current(city: city)) { result in
            switch result {
            case .success(let response):
                
                break
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
