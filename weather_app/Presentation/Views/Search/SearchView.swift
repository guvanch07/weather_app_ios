//
//  SearchView.swift
//  weather_app
//
//  Created by Guvanch Amanov on 14.12.23.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var searchVm = SearchWeatherViewModel()
    @State private var searchText = ""
    @Binding var showSearchBar: Bool
    @State private var showingSheet = false
    
    var body: some View {
        VStack {
            if showSearchBar {
                SearchBar(text: $searchText)
                    .onChange(of: searchText) { _, newValue in
                        if newValue.count > 2{
                            Task{
                                await searchVm.searchCity(city: newValue)
                            }
                        }
                    }.transition(.move(edge: .top))
            }
            if !searchText.isEmpty{
                List(searchVm.searchCityData, id: \.lat) { item in
                    if searchVm.isLoading{
                        ProgressView()
                    }else{
                        HStack{
                            Text(item.name)
                                .font(.system(size: 20))
                            Spacer()
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            showingSheet = true
                            searchText = ""
                            showSearchBar = false
                        }
                    }
                }
                .frame(height:250)
                .cornerRadius(20)
                .padding(.horizontal,15)
            }else{
                Spacer()
            }
        }.sheet(isPresented: $showingSheet){
            CityDetailView()
        }
        .alert(isPresented: $searchVm.hasError, error: searchVm.error) {
            Button{  }
        label: { Text("Try again") }
        }
    }
}

