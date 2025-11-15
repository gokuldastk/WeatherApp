//
//  SplashView.swift
//  WeatherApp
//
//  Created by Gokul on 15/11/25.
//


import SwiftUI

struct SplashView: View {
    @State private var isActive = false

    var body: some View {
        Group {
            if isActive {
                WeatherView()
            } else {
                ZStack {
                    Color.blue.opacity(0.3)
                        .ignoresSafeArea()

                    VStack {
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 180, height: 180)

                        Text("Weather App")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.top, 10)
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isActive = true
                }
            }
        }
    }
}
