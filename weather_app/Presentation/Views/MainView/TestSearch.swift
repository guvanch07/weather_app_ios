//
//  TestSearch.swift
//  weather_app
//
//  Created by Guvanch Amanov on 13.12.23.
//

import SwiftUI

import SwiftUI

struct TestSearch: View {
    @State private var searchQuery = ""
    @State private var showSearchBar = false

    var body: some View {
        ScrollView {
            GeometryReader { geometry in
                Color.clear.preference(key: ViewOffsetKey.self, value: geometry.frame(in: .global).minY)
            }
            .frame(height: 0)

            // Your content goes here
            ForEach(0..<100) { i in
                Text("Item \(i)")
            }
        }
        .onPreferenceChange(ViewOffsetKey.self) { value in
            // Change the threshold value as needed
            showSearchBar = value < -100
        }
        .overlay(
            VStack {
                if showSearchBar {
                    SearchBar(text: $searchQuery)
                        .transition(.move(edge: .top))
                }
                Spacer()
            }
        )
    }
}


