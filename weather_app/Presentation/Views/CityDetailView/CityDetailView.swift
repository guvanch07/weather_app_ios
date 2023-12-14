//
//  CityDetailView.swift
//  weather_app
//
//  Created by Guvanch Amanov on 14.12.23.
//

import SwiftUI

struct CityDetailView: View {
    @StateObject var vm : DetailWeatherViewModel
    var body: some View {
        VStack{
            if vm.isLoading {
                ProgressView()
            }else{
                ZStack {
                         RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray)
                            .padding(10)
                            .aspectRatio(1.0, contentMode: .fit)
                    VStack{
                        Text("\(vm.currentWeather?.name ?? "")")
                            .font(.system(size: 32))
                        Text("\((vm.currentWeather?.main.temp.convertorKeltoCel ?? 0).rounder)°C")
                            .font(.system(size: 52))
                        Text("\(vm.currentWeather?.weather.first?.main ?? "")")
                            .font(.system(size: 24))
                        HStack{
                            Text("Max: \((vm.currentWeather?.main.tempMax.convertorKeltoCel ?? 0).rounder)")
                                .font(.system(size: 24))
                            Text("Min: \((vm.currentWeather?.main.tempMin.convertorKeltoCel ?? 0).rounder)")
                                .font(.system(size: 24))
                        }
                    }
                      }
            }
        }.alert(isPresented: $vm.hasError, error: vm.error) {
            Button{  }
        label: { Text("Try again") }
        }
    }
}

