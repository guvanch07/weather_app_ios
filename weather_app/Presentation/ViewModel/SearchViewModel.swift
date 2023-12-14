//
//  SearchViewModel.swift
//  weather_app
//
//  Created by Guvanch Amanov on 14.12.23.
//

import Foundation
import Combine


final class SearchWeatherViewModel: ObservableObject{
    @Published var searchCityData: [SearchWeatherModelElement] = []
    @Published private(set) var isLoading = false
    @Published var hasError = false
    @Published  var error: UserError?
   // @Published var searchText = ""
    private let searchWeatherUseCase = SearchWeatherUseCase() //TO DO add to DI
    
//    private var cancellables: Set<AnyCancellable> = []
//
//        init() {
//            $searchText
//                .debounce(for: 0.5, scheduler: RunLoop.main)
//                .removeDuplicates()
//                .sink { [weak self] query in
//                    Task {
//                        await self?.searchCity(city: query)
//                    }
//                }
//                .store(in: &cancellables)
//        }
    
    
    func searchCity(city: String)  async{
        DispatchQueue.main.async{
            self.isLoading = true
        }
        do {
            let usecase = try await searchWeatherUseCase.execute(city: city)
            DispatchQueue.main.async{
                //self.searchCityData.removeAll()
                self.searchCityData = usecase
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
