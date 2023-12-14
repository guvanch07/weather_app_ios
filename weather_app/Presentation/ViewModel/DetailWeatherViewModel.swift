//
//  DetailWeatherViewModel.swift
//  weather_app
//
//  Created by Guvanch Amanov on 15.12.23.
//

import Foundation
import Combine

final class DetailWeatherViewModel: ObservableObject{
    @Published var currentWeather: CurrentWeatherModel?
    @Published private(set) var isLoading = false
    @Published var hasError = false
    @Published  var error: UserError?
    
    private let currentWeatherUseCase = CurrentWeatherUseCase() //TO DO add to DI
    
    func getDetailWeather(lat: Double, lon: Double)  async {
        DispatchQueue.main.async{
            self.isLoading = true
        }
        do {
            let usecaseCurrent = try await currentWeatherUseCase.execute(lat: lat, lon: lon)
            DispatchQueue.main.async{
                self.currentWeather = usecaseCurrent
                self.isLoading = false
                
            }
        }catch{
            DispatchQueue.main.async{
                if let userErr = error as? UserError{
                    self.hasError = true
                    self.error = userErr
                    self.isLoading = false
                }
            }
        }
    }
}

