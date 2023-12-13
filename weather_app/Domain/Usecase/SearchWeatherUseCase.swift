//
//  SearchWeatherUseCase.swift
//  weather_app
//
//  Created by Guvanch Amanov on 10.12.23.
//

import Foundation

class SearchWeatherUseCase {
    private let repository: IRepository
    
    init() {
        repository = Repository(httpService: HttpService())
    }
    
    func execute(city: String) async throws -> SearchWeatherModel {
        try await repository.searchWeather(city: city)
    }
}
