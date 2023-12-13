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
    
    func getForcastWeather(lat: Double, lon: Double) async throws -> ForcastWeatherModel {
        let response = try await httpService.get(
            endPoint: "\(AppCons.baseUrl)onecall?lat=\(lat)&lon=\(lon)&appid=\(AppCons.appId)",
            type: ForcastWeatherModel.self)
        return response
    }
    
    func searchWeather(city:String) async throws -> SearchWeatherModel {
        let url = "http://api.openweathermap.org/geo/1.0/"
        let response = try await httpService.get(
            endPoint: "\(url)direct?q=\(city)&appid=\(AppCons.appId)",
            type: SearchWeatherModel.self)
        return response
    }
    
}
