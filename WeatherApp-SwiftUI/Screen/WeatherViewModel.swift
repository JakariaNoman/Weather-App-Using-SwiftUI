//
//  ViewModel.swift
//  WeatherApp-SwiftUI
//
//  Created by Jakaria Noman on 19/1/25.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var temp: String = ""
    @Published var id: Int = 12
    @Published var isLoading: Bool = true
    
    init() {
   //     getWeatherData()
    }
    
    @MainActor func getWeatherData() async {

       APIManager.fetchWeatherData() { [weak self] result in
          
           guard let self else { return }
           self.isLoading = false
           
           switch result {
           case .success(let WeatherInfo):
               DispatchQueue.main.async {
                   self.title = WeatherInfo.name
                   self.temp = "\(WeatherInfo.main.temp)°C" //option + shift + 8 = °
                   self.description = WeatherInfo.weather[0].description
               }
           case .failure(let error):
               print("Error data is found:\(error)")
               
           }
       }
    }
}
