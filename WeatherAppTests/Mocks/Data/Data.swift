//
//  Data.swift
//  WeatherAppTests
//
//  Created by Gokul on 15/11/25.
//

import Foundation
import CoreLocation
@testable import WeatherApp

let testLocation: CLLocation = CLLocation(latitude: 12.939898, longitude: 77.5699)

let jsonString = """
{
   "location": {
     "name": "Bangalore",
     "region": "Karnataka",
     "country": "India",
     "lat": 12.983,
     "lon": 77.583,
     "tz_id": "Asia/Kolkata",
     "localtime_epoch": 1763225169,
     "localtime": "2025-11-15 22:16"
   },
   "current": {
     "last_updated_epoch": 1763225100,
     "last_updated": "2025-11-15 22:15",
     "temp_c": 20.1,
     "temp_f": 68.2,
     "is_day": 0,
     "condition": {
       "text": "Mist",
       "icon": "//cdn.weatherapi.com/weather/64x64/night/143.png",
       "code": 1030
     },
     "wind_mph": 6.9,
     "wind_kph": 11.2,
     "wind_degree": 83,
     "wind_dir": "E",
     "pressure_mb": 1020.0,
     "pressure_in": 30.12,
     "precip_mm": 0.0,
     "precip_in": 0.0,
     "humidity": 88,
     "cloud": 25,
     "feelslike_c": 20.1,
     "feelslike_f": 68.2,
     "windchill_c": 18.7,
     "windchill_f": 65.6,
     "heatindex_c": 18.7,
     "heatindex_f": 65.6,
     "dewpoint_c": 14.4,
     "dewpoint_f": 57.9,
     "vis_km": 3.0,
     "vis_miles": 1.0,
     "uv": 0.0,
     "gust_mph": 11.7,
     "gust_kph": 18.8,
     "short_rad": 0,
     "diff_rad": 0,
     "dni": 0,
     "gti": 0
   }
}
"""

let jsonData = jsonString.data(using: .utf8)!
