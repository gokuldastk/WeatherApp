//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Gokul on 14/11/25.
//

import SwiftUI

struct WeatherView: View {
    
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        ZStack {

            LinearGradient(
                colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 25) {
                
                Text("Weather App")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                if viewModel.isLoading {
                    ProgressView("Fetching Weather...")
                        .foregroundColor(.white)
                }
                
                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                }
                
                if let weather = viewModel.weather {
                    VStack(spacing: 15) {
                        Text(weather.location.name)
                            .font(.title.bold())
                            .foregroundColor(.white)
                        Text("\(weather.current.temp_c, specifier: "%.1f")°C")
                            .font(.system(size: 70).bold())
                            .foregroundColor(.white)
                        Text(weather.current.condition.text)
                            .font(.title3)
                            .foregroundColor(.white.opacity(0.9))
                        AsyncImage(url: URL(string: "https:\(weather.current.condition.icon)")) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                        } placeholder: {
                            ProgressView()
                        }
                        HStack(spacing: 20) {
                            WeatherInfoCard(
                                title: "Wind",
                                value: "\(String(format: "%.0f", weather.current.wind_kph)) kph"
                            )
                            WeatherInfoCard(title: "Humidity", value: "\(weather.current.humidity)%")
                        }
                        HStack(spacing: 20) {
                            WeatherInfoCard(
                                title: "Feels Like",
                                value: "\(String(format: "%.1f", weather.current.feelslike_c))°C"
                            )
                            WeatherInfoCard(
                                title: "UV Index",
                                value: String(format: "%.1f", weather.current.uv)
                            )
                        }
                    }
                    .padding()
                    .background(.white.opacity(0.15))
                    .cornerRadius(20)
                    .shadow(radius: 10)
                }
                Button(action: {
                    Task { await viewModel.fetchWeather() }
                }) {
                    Text("Refresh")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.2))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
        }
        .task {
            await viewModel.fetchWeather()
        }
    }
}
struct WeatherInfoCard: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.caption)
                .foregroundColor(.white.opacity(0.8))
            
            Text(value)
                .font(.headline.bold())
                .foregroundColor(.white)
        }
        .frame(width: 120, height: 70)
        .background(Color.white.opacity(0.2))
        .cornerRadius(15)
        .shadow(radius: 3)
    }
}
