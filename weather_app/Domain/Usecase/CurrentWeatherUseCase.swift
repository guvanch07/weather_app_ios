//
//  CurrentWeatherUseCase.swift
//  weather_app
//
//  Created by Guvanch Amanov on 9.12.23.
//

import Foundation

class CurrentWeatherUseCase {
    private let repository: IRepository
    
    init() {
        repository = Repository(httpService: HttpService())
    }
    
    func execute(lat: Double, lon: Double) async throws -> CurrentWeatherModel {
        try await repository.getCurrentWeather(lat: lat, lon: lon)
    }
}
