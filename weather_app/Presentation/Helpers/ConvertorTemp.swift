//
//  ConvertorTemp.swift
//  weather_app
//
//  Created by Guvanch Amanov on 13.12.23.
//

import Foundation


extension Double{
    var convertorCelToFah: Double {
        return (self * 1.8) + 32
    }
    var convertorFahToCel: Double {
        return (self - 32) / 1.8
    }
    var convertorKeltoCel:Double{
        return self - 273.15
    }
    
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    var rounder: String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let number =  numberFormatter.string(from: NSNumber(value: self)) 
        else { fatalError("Can not get number") }
        return number
    }
    var secondToHour: Int {
        let date = Date(timeIntervalSince1970: self)
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        return hour
    }
    var secondToDay: String {
        let date = Date(timeIntervalSince1970: self)
        let calendar = Calendar.current
        let weekdayNumber = calendar.component(.weekday, from: date)
        let formatter = DateFormatter()
            let weekdayName = formatter.weekdaySymbols[weekdayNumber - 1]
        return weekdayName
    }
    var secondToHour24: String {
        let date = Date(timeIntervalSince1970: self)
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        let hourString = formatter.string(from: date)
        return hourString
    }
}
