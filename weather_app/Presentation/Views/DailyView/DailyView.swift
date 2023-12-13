//
//  DailyView.swift
//  weather_app
//
//  Created by Guvanch Amanov on 13.12.23.
//

import SwiftUI

struct DailyView: View {
    let days: [Daily]
    var body: some View {
        
        ForEach(days,id: \.dt) { item in
            BlurView(style: .systemMaterialLight, alpha: 0.5){
                HStack{
                    Text("\(Double(item.dt).secondToDay)")
                    Spacer()
                    Image(systemName: iconForWeatherCode(item.weather.first?.icon ?? ""))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                    Spacer()
                    Text("\(item.temp.day.convertorKeltoCel.rounder)")
                        .font(.system(size: 20))
                }.padding(.horizontal,10)
            }
            .frame(height: 50)
            .cornerRadius(20)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
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

#Preview {
    DailyView(days: [])
}
