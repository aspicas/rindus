//
//  WeatherService.swift
//  rindus
//
//  Created by David Garcia on 27/12/21.
//

import Foundation
import Moya

enum WeatherService {
    static private let appId = "148cfb984b8fe7eb29e954d32898e2b7"
    case current(city: String)
}


extension WeatherService: TargetType {
    var baseURL: URL {
        URL(string: "http://api.openweathermap.org/data/2.5")!
    }
    
    var path: String {
        switch self {
        case .current(city: _):
            return "/weather"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .current(_):
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .current(let city):
            return .requestParameters(parameters: ["q": city, "appid": WeatherService.appId],
                                      encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
