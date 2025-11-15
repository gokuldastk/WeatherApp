//
//  APIManager.swift
//  WeatherApp
//
//  Created by Gokul on 14/11/25.
//

import Foundation

enum API {
    private static let apiKey = "55a496a4933a4b50965124601251411"

    case weatherInfo(lat: Double, lon: Double)
  //  case weatherByCity(String)

    var urlString: String {
        switch self {
        case .weatherInfo(let lat, let lon):
            return "https://api.weatherapi.com/v1/current.json?key=\(API.apiKey)&q=\(lat),\(lon)&aqi=no"

//        case .weatherByCity(let city):
//            return "https://api.weatherapi.com/v1/current.json?key=\(API.apiKey)&q=\(city)&aqi=no"
        }
    }
    
    var url: URL? {
        URL(string: urlString)
    }
}

enum ApiResult {
    case success(Codable)
    case failure(String)
}

class APIManager {
    
    private var apiClient: NetworkClient!
    
    init(apiClient: NetworkClient = HttpClient()) {
        self.apiClient = apiClient
    }
    
    func fetchWeatherInfo(for lat: Double, lon: Double) async -> ApiResult {
        
        let api = API.weatherInfo(lat: lat, lon: lon)
        
        let result = await  apiClient.get(api: api)
        
        switch result {
        case .success(let data):
            guard let weatherInfo = try? JSONDecoder().decode(WeatherResponse.self, from: data) else {
                return .failure("Data unable to parse")
            }
            return .success(weatherInfo)
            
        case .failure(let errorString):
            return .failure(errorString)
        }
        
    }
}
