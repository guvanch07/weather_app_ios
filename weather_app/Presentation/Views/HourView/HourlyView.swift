//
//  HourlyView.swift
//  weather_app
//
//  Created by Guvanch Amanov on 13.12.23.
//

import SwiftUI

struct HourlyView: View {
    let hours: [Current]
    
    var body: some View {
        BlurView(style: .systemMaterialLight, alpha: 0.5){
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(hours.prefix(9),id: \.dt) { item in
                            HourlyItem(item: item)
                        }
                    }
                }
        }
        .frame(height: 200)
        .cornerRadius(30)
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
    }
}

#Preview {
    HourlyView(hours: [])
}
