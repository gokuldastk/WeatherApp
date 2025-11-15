//
//  WeatherViewTests.swift
//  WeatherAppTests
//
//  Created by Gokul on 15/11/25.
//

import Testing
import Foundation

@testable import WeatherApp

struct WeatherViewModelTests {
        
    @Test func test_fetchWeather() async throws {
        
        let apiManagerMock: APIManaging = MockAPIManager()
        let mockLocationHandler: LocationHandling = MockLocationHandler()
        
        let vm =  await WeatherViewModel(apiManager: apiManagerMock, locationHandler: mockLocationHandler)

        await vm.fetchWeather()
        
        let expected = await vm.weather
        
        let actual = try? JSONDecoder().decode(WeatherResponse.self, from: jsonData)
        
        #expect(expected?.location.name == actual?.location.name)
        #expect(expected?.location.lon == actual?.location.lon)
        #expect(expected?.location.lat == actual?.location.lat)
    }
}

