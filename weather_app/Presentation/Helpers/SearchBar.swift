//
//  SearchBar.swift
//  weather_app
//
//  Created by Guvanch Amanov on 14.12.23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        TextField("Search...", text: $text)
            .keyboardType(.webSearch)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding()
    }
}
