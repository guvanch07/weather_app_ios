//
//  MainViewModel.swift
//  weather_app
//
//  Created by Guvanch Amanov on 9.12.23.
//

import Foundation
import Combine

final class CurrentWeatherViewModel: ObservableObject{
    
    @Published var currentWeather: CurrentWeatherModel?
    @Published private(set) var isLoading = false
    @Published var hasError = false
    @Published  var error: UserError?
    
    private let currentWeatherUseCase = CurrentWeatherUseCase() //TO DO add to DI
    
    func getWeatherRoutes(lat: Double, lon: Double)  async {
        DispatchQueue.main.async{
            self.isLoading = true
        }
        do {
            let usecase = try await currentWeatherUseCase.execute(lat: lat, lon: lon)
            DispatchQueue.main.async{
                self.currentWeather = usecase
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
