//
//  MainWeatherUIView.swift
//  weather_app
//
//  Created by Guvanch Amanov on 9.12.23.
//

import SwiftUI

struct MainWeatherUIView: View {
    @StateObject private var vm = CurrentWeatherViewModel()
    var body: some View {
        VStack{
            if vm.isLoading {
                Spacer()
                ProgressView()
                Spacer()
            }else{
                Text("current\(vm.currentWeather?.main.temp ?? 0)")
                if let weatherItems = vm.currentWeather?.weather {
                    List(weatherItems, id: \.id) { item in
                        Image(systemName: iconForWeatherCode(item.icon))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    }
                } else {
                    Text("Empty")
                }
            }
        }
        .onAppear{
            Task{
                await vm.getWeatherRoutes(lat: 53.9006, lon: 27.5590)
            }
        }
        .alert(isPresented: $vm.hasError, error: vm.error) {
            Button{
                Task{
                    //await vm.getCurrentRoutes()
                }
            }label: {
                Text("OK")
            }
        }
    }
    func iconForWeatherCode(_ code: String) -> String {
            switch code {
            case "01d": return "sun.max" // Example for clear day
            case "01n": return "moon"    // Example for clear night
            case "04n": return "cloud.moon" // Example for broken clouds night
            default: return "questionmark"
            }
        }
}

#Preview {
    MainWeatherUIView()
}
