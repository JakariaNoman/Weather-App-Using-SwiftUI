//
//  Untitled.swift
//  WeatherApp-SwiftUI
//
//  Created by Jakaria Noman on 19/1/25.
//
import Foundation

struct WeatherInfo: Codable {
    var name: String
    var weather: [Weather]
    var main: Main
}

struct Weather: Codable {
    var description: String
}

struct Main: Codable {
    var temp: Double
}
