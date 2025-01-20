//
//  ContentView.swift
//  WeatherApp-SwiftUI
//
//  Created by Jakaria Noman on 19/1/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView{
            
            ZStack {
                VStack {
                    if viewModel.isLoading {
                        ProgressView("")
                            .progressViewStyle(CircularProgressViewStyle())
                            .frame(width: 100, height: 100)
                            .scaleEffect(2.0)
                            .position(CGPoint(x: 15, y: 10))
                            .padding(20)
                    } else {
                        Button(action: {
                            viewModel.isLoading = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            Task{
                                await viewModel.getWeatherData()
                            }
                        }
                        }) {Image(systemName: "arrow.clockwise")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .position(CGPoint(x: 15, y: 10))
                                .padding(10)
                        }
                        VStack {
                            Text(viewModel.title)
                                .font(.system(size: 32))
                                .padding(.top, 5)
                            Text(viewModel.description)
                                .font(.system(size: 44))
                            Text(viewModel.temp)
                                .font(.system(size: 24))
                            Spacer()
                        }
                    }
                }
                .navigationTitle("Weather App")
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    Task{
                        await viewModel.getWeatherData()
                    }
                }

                }
            }
            
        }
    }
}

#Preview {
    ContentView()
}

@main
struct WeatherApp_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

