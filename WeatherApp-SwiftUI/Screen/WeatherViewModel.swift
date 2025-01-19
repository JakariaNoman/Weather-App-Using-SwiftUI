//
//  ViewModel.swift
//  WeatherApp-SwiftUI
//
//  Created by Jakaria Noman on 19/1/25.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var title: String = "_"
    @Published var description: String = "_"
    @Published var temp: String = ""
    @Published var id : Int = 12
    
    init() {
        getWeatherData()
        
    }
    
    func getWeatherData() {
       APIManager.fetchWeatherData() { [weak self] result in
           guard let self else { return }
           
           switch result {
           case .success(let WeatherInfo):
               DispatchQueue.main.async {
                   self.title = WeatherInfo.name
                   self.temp = "\(WeatherInfo.main.temp)°C" //option + shift + 8 = °
                   self.description = WeatherInfo.weather[0].description
                   //print(self.id)
               }
               
           case .failure(let error):
               print("Error data is found:\(error)")
               
           }
       }
    }
}
