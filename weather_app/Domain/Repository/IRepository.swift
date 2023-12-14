//
//  IRepository.swift
//  weather_app
//
//  Created by Guvanch Amanov on 9.12.23.
//

import Foundation

protocol IRepository{
    func getCurrentWeather(lat: Double, lon: Double) async throws -> CurrentWeatherModel
    func getForcastWeather(lat: Double, lon: Double) async throws -> ForcastWeatherModel
    func searchWeather(city: String) async throws -> [SearchWeatherModelElement]
}
