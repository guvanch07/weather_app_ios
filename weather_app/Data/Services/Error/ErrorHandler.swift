//
//  ErrorHandler.swift
//  weather_app
//
//  Created by Guvanch Amanov on 9.12.23.
//

import Foundation

enum UserError: LocalizedError{
    case custom(error:Error)
    case badUrl
    case noAuth
    case noData
    case serverInternal
    case notFound
    case badRequest
    case noInternet
    case unknown
    
    var errorDescription: String?{
        switch self {
        case .badUrl:
            return "Bad Request"
        case .badRequest:
            return "No valid request"
        case .custom(let error):
            return error.localizedDescription
        case .noData:
            return "Not Found"
        case .noAuth:
            return "Fail with authorization"
        case .serverInternal:
            return "Fail server"
        case .noInternet:
            return "No Internet"
        case .unknown:
            return "unknown"
        case .notFound:
            return "not found"
        }
    }
}
