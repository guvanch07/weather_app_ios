//
//  MainWeatherUIView.swift
//  weather_app
//
//  Created by Guvanch Amanov on 9.12.23.
//

import SwiftUI

struct MainWeatherUIView: View {
    let current: CurrentWeatherModel?
    
    var body: some View {
        BlurView(style: .systemMaterialLight, alpha: 0.5){
            VStack{
                Text("\(current?.name ?? "")")
                    .font(.system(size: 32))
                Text("\((current?.main.temp.convertorKeltoCel ?? 0).rounder)°C")
                    .font(.system(size: 52))
                Text("\(current?.weather.first?.main ?? "")")
                    .font(.system(size: 24))
                HStack{
                    Text("Max: \((current?.main.tempMax.convertorKeltoCel ?? 0).rounder)")
                        .font(.system(size: 24))
                    Text("Min: \((current?.main.tempMin.convertorKeltoCel ?? 0).rounder)")
                        .font(.system(size: 24))
                }
            }
        }
        .frame(height: 200)
        .cornerRadius(30)
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
    }
    
}

#Preview {
    MainWeatherUIView(current: nil)
}
