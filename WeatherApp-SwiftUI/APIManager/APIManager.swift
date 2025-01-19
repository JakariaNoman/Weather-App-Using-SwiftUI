//
//  APIManager.swift
//  WeatherApp-SwiftUI
//
//  Created by Jakaria Noman on 19/1/25.
//

import Foundation

enum DataError: Error {
    case invalidError
    case invalidData
}

final class APIManager {
    //(Result<[ProductInfo],DataError>) -> Void
    static func fetchWeatherData(completion: @escaping (Result<WeatherInfo, DataError>)-> Void) {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?&appid=83e0371b238e111391e19337fb58cf1c&units=metric&q=Barisal") else {
            completion(.failure(.invalidError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data , error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decodeData = try JSONDecoder().decode(WeatherInfo.self, from: data)
                completion(.success(decodeData))
            } catch {
                completion(.failure(.invalidData))
            }
            
        }.resume()
    }
}
