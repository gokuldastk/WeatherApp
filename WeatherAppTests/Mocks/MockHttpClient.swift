//
//  MockHttpClient.swift
//  WeatherApp
//
//  Created by Gokul on 15/11/25.
//


import Foundation
@testable import WeatherApp

final class MockHttpClient: NetworkClient {

    var expectedResult: HttpResult!

    func get(api: API) async -> HttpResult {
        return expectedResult
    }
}
