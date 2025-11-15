//
//  HttpClient.swift
//  WeatherApp
//
//  Created by Gokul on 14/11/25.
//

import Foundation

enum HttpResult {    
    case success(Data)
    case failure(String)
}

protocol NetworkClient {
    func get(api: API) async -> HttpResult
}

class HttpClient: NetworkClient {
    
    func get(api: API) async -> HttpResult {
        
        guard let url = api.url else {
            return HttpResult.failure("Invalid URL")
        }
        do {
            let result = try await URLSession.shared.data(from: url)
            return HttpResult.success(result.0)
        } catch {
            return HttpResult.failure("Api failed to retur data")
        }
    }
    
}
