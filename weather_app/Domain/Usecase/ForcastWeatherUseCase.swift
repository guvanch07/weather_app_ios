//
//  ForcastWeatherUseCase.swift
//  weather_app
//
//  Created by Guvanch Amanov on 10.12.23.
//

import Foundation

class ForcastWeatherUseCase {
    private let repository: IRepository
    
    init() {
        repository = Repository(httpService: HttpService())
    }
    
    func execute(lat: Double, lon: Double) async throws -> ForcastWeatherModel {
        try await repository.getForcastWeather(lat: lat, lon: lon)
    }
}
