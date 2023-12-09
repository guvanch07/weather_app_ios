//
//  Item.swift
//  weather_app
//
//  Created by Guvanch Amanov on 8.12.23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
