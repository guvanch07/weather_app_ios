//
//  http_handler.swift
//  weather_app
//
//  Created by Guvanch Amanov on 9.12.23.
//

import Foundation

final class HttpService{
    
    func get<T:Codable>(endPoint:String, type: T.Type) async throws -> T {
        guard let url = URL(string: endPoint) else {
            print("error in url")
            throw UserError.badUrl
            }
        var request = URLRequest(url: url)
        // handle token if is exist
        request.httpMethod = "GET"
        let (data,response) = try await URLSession.shared.data(for: request)
    
        let httpResponse = response as? HTTPURLResponse
        guard httpResponse?.statusCode == 200 else {
            switch httpResponse?.statusCode {
            case 400:
                throw UserError.badRequest
            case 401:
                throw UserError.noAuth
            case 403:
                throw UserError.noAuth
            case 404:
                throw UserError.notFound
            case 500:
                throw UserError.serverInternal
            default:
                throw UserError.unknown
            }
        }
        do{
            let decoder = JSONDecoder()
            //decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decoded = try decoder.decode(T.self, from: data)
            print(decoded)
            return decoded
        }catch{
            throw UserError.noData
        }
    }
    
    func post<T:Codable>(endPoint:String,data:Data?,type: T.Type) async throws -> T {
        
        guard let url = URL(string: endPoint) else {
            print("error in url")
            throw UserError.badUrl
        }
        do{
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = data
            // handle jwt token if is exist
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
            let (data, response) = try await URLSession.shared.data(for: request)
            
            let httpResponse = response as? HTTPURLResponse
            
            guard httpResponse?.statusCode == 200 else {
                switch httpResponse?.statusCode {
                case 400:
                    throw UserError.badRequest
                case 401:
                    throw UserError.noAuth
                case 403:
                    throw UserError.noAuth
                case 404:
                    throw UserError.notFound
                case 500:
                    throw UserError.serverInternal
                default:
                    throw UserError.unknown
                }
            }
            let answer = try JSONDecoder().decode(T.self, from: data)
            return answer
        }catch{
            throw UserError.noData
        }
    }

}

