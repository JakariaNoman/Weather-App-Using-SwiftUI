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
            VStack {
                Text(viewModel.title)
                    .font(.system(size: 32))
                Text(viewModel.description)
                    .font(.system(size: 44))
                Text(viewModel.temp)
                    .font(.system(size: 24))
            }
            .navigationTitle("Weather App")
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

