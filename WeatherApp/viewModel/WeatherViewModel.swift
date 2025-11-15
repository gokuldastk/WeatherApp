//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Gokul on 14/11/25.
//


import Foundation
import CoreLocation

@MainActor
class WeatherViewModel: ObservableObject {
    
    @Published var weather: WeatherResponse?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let apiManager: APIManaging
    private let locationManager: LocationHandling
    
    init(apiManager: APIManaging = APIManager(),
         locationHandler: LocationHandling = LocationHandler.shared) {
        
        self.apiManager = apiManager
        self.locationManager = locationHandler
    }
    
    func fetchWeather() async {
        isLoading = true
        errorMessage = nil
        
        guard let location = await locationManager.getCurrentLocation() else {
            isLoading = false
            errorMessage = "Unable to get location"
            return
        }
        
        let lat = location.coordinate.latitude
        let lon = location.coordinate.longitude
        
        let result = await apiManager.fetchWeatherInfo(for: lat, lon: lon)
        
        switch result {
        case .success(let data):
            self.weather = data
        case .failure(let error):
            self.errorMessage = error
        }
        
        isLoading = false
    }
}

