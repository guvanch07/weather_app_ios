//
//  Home.swift
//  weather_app
//
//  Created by Guvanch Amanov on 12.12.23.
//

import SwiftUI

struct Home: View {
    let lat: Double
    let lon: Double
    
    @StateObject private var vm = CurrentWeatherViewModel()
    @State private var showSearchBar = false
    
    var body: some View {
        ScrollView{
            if vm.isLoading {
                Spacer()
                ProgressView()
                Spacer()
            }else{
                GeometryReader { geometry in
                    Color.clear.preference(key: ViewOffsetKey.self, value: geometry.frame(in: .global).minY)
                }
                
                MainWeatherUIView(current: vm.currentWeather)
                Spacer().frame(height: 20)
                HourlyView(hours: vm.forcastWeather?.hourly ?? [])
                Spacer().frame(height: 20)
                DailyView(days: vm.forcastWeather?.daily ?? [])
            }
        }
        .onPreferenceChange(ViewOffsetKey.self) { value in
            showSearchBar = value < -50
        }.overlay(
            SearchView(showSearchBar: $showSearchBar)
        )
        .onAppear{
            Task{ await vm.getWeather(lat: lat, lon: lon) }
        }.alert(isPresented: $vm.hasError, error: vm.error) {
            Button{ Task{ await vm.getWeather(lat: lat, lon: lon) } }
        label: { Text("Try again") }
        }
    }
}

#Preview {
    Home(lat: 53.23, lon: 37.43)
}

struct ViewOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
