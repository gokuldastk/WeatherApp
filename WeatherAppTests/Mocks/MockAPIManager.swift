//
//  MockAPIManager.swift
//  WeatherApp
//
//  Created by Gokul on 15/11/25.
//


import Foundation
@testable import WeatherApp

final class MockAPIManager: APIManaging {

    var expectedResult: ApiResult!

    func fetchWeatherInfo(for lat: Double, lon: Double) async -> ApiResult {
        
        guard let  weatherResponse: WeatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from:jsonData) else {
            
            return ApiResult.failure("Parser failed")
        }
        
        let result = ApiResult.success(weatherResponse)
        return result
    }
}
