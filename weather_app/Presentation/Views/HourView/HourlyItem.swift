//
//  HourlyItem.swift
//  weather_app
//
//  Created by Guvanch Amanov on 13.12.23.
//

import SwiftUI

struct HourlyItem: View {
    let item: Current
    var body: some View {
        VStack{
            Text("\(Double(item.dt).secondToHour24)")
                .font(.system(size: 20))
            Image(systemName: iconForWeatherCode(item.weather.first?.icon ?? ""))
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding()
            Text("\(item.temp.convertorKeltoCel.rounder)")
                .font(.system(size: 20))
        }
    }
    func iconForWeatherCode(_ code: String) -> String {
        switch code {
        case "01d": return "sun.max"
        case "01n": return "moon"
        case "04n": return "cloud.moon"
        default: return "questionmark"
        }
    }
}
