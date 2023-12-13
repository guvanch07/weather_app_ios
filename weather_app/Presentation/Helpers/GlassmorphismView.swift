//
//  GlassmorphismView.swift
//  weather_app
//
//  Created by Guvanch Amanov on 13.12.23.
//

import SwiftUI






struct Glassmorphism: View {
    
    @State private var animateshape = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .pink.opacity(0.3), .pink]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
            
            ZStack {
                BlurView(style: .systemMaterialLight, alpha: 0.5) {
                    VStack {
                        Text("Weather Info")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                    }
                }
                .frame(width: 300, height: 200)
                .cornerRadius(20)
            }
        }
        
    }
}
