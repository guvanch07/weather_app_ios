//
//  Home.swift
//  weather_app
//
//  Created by Guvanch Amanov on 12.12.23.
//

import SwiftUI

struct Home: View {
    @StateObject private var vm = CurrentWeatherViewModel()
    let lat: Double
    let lon: Double
    var body: some View {
        VStack(spacing: 30){
            if vm.isLoading {
                ProgressView()
            }else{
                MainWeatherUIView(current: vm.currentWeather)
                HourlyView(hours: vm.forcastWeather?.hourly ?? [])
            }
        }
        .onAppear{
            Task{
                await vm.getWeather(lat: lat, lon: lon)
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
}

#Preview {
    Home(lat: 53.23, lon: 37.43)
}
