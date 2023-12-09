//
//  Repository_Impl.swift
//  weather_app
//
//  Created by Guvanch Amanov on 9.12.23.
//

import Foundation

class Repository: IRepository{
    
    let httpService: HttpService
    
    init(httpService: HttpService) { // TO DO add to DI
        self.httpService = httpService
    }
    
    func getCurrentWeather(lat: Double, lon: Double) async throws -> CurrentWeatherModel {
        let response = try await httpService.get(
            endPoint: "\(AppCons.baseUrl)weather?lat=\(lat)&lon=\(lon)&appid=\(AppCons.appId)",
            type: CurrentWeatherModel.self)
        return response
    }
    
    
}
