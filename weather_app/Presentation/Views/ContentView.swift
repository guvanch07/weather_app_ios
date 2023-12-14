//
//  ContentView.swift
//  weather_app
//
//  Created by Guvanch Amanov on 8.12.23.
//

import SwiftUI
import SwiftData

let lon = 27.5590
let lat = 53.9006

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
    
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.purple, .pink.opacity(0.3), .pink]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
                if let location = locationManager.location{
                    Home(lat: location.latitude, lon: location.longitude)
                }else {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            }
        
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}


//        NavigationSplitView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//        } detail: {
//            Text("Select an item")
//        }
//private func addItem() {
//    withAnimation {
//        let newItem = Item(timestamp: Date())
//        modelContext.insert(newItem)
//    }
//}
//
//private func deleteItems(offsets: IndexSet) {
//    withAnimation {
//        for index in offsets {
//            modelContext.delete(items[index])
//        }
//    }
//}
