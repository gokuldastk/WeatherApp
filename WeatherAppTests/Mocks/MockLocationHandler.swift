//
//  MockLocationHandler.swift
//  WeatherApp
//
//  Created by Gokul on 15/11/25.
//


import CoreLocation
@testable import WeatherApp

final class MockLocationHandler: LocationHandling {
    func requestPermission() {
        
    }
    
    func requestLocation() {
        
    }
    
    func getCurrentLocation() async -> CLLocation? {
        return location
    }
    
    var location: CLLocation? = testLocation
    
    var authorizationStatus: CLAuthorizationStatus = .authorizedAlways
    
    var locationError: String? = nil
}


