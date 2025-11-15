//
//  LocationHandler.swift
//  WeatherApp
//
//  Created by Gokul on 14/11/25.
//

import Foundation
import CoreLocation

final class LocationHandler: NSObject, ObservableObject {
    
    static let shared = LocationHandler()
    
    private let manager = CLLocationManager()
    
    @Published var location: CLLocation?
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    @Published var locationError: String?
    
    private override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestPermission() {
        manager.requestWhenInUseAuthorization()
    }
    
    func requestLocation() {
        if authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways {
            manager.requestLocation()
        } else {
            requestPermission()
        }
    }
    
    func getCurrentLocation() async -> CLLocation? {
        await withCheckedContinuation { continuation in
            self.requestLocation()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                continuation.resume(returning: self.location)
            }
        }
    }
}

extension LocationHandler: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        self.authorizationStatus = manager.authorizationStatus
        
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            manager.requestLocation()
        case .denied, .restricted:
            self.locationError = "Location permission denied."
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let loc = locations.first else { return }
        self.location = loc
        print(" Location updated: \(loc.coordinate.latitude), \(loc.coordinate.longitude)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.locationError = error.localizedDescription
        print(" Location error: \(error.localizedDescription)")
    }
}

