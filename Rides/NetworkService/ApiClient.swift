//
//  ApiClient.swift
//  Rides
//
//  Created by Anton Rybaiev on 2024-09-20.
//

import Foundation

final class ApiClient {
    
    static var shared: ApiClient = ApiClient()
  
    let session: URLSession
    
    private static var defaultSessionConfiguration: URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        configuration.timeoutIntervalForRequest = 60 // seconds that a task will wait for data to arrive
        configuration.timeoutIntervalForResource = 300 // seconds for whole resource request to complete ,.
        return configuration
    }
    
    init(configuration: URLSessionConfiguration = defaultSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    func asyncRequest<T: Decodable>(endpoint: EndpointProvider) async throws -> T {
        do {
            let (data, response) = try await session.data(for: endpoint.asURLRequest())
            return try self.manageResponse(data: data, response: response)
        } catch let error as ApiError {
            throw error
        } catch {
            throw ApiError(
                message: "Unknown API error \(error.localizedDescription)"
            )
        }
    }
    
    private func manageResponse<T: Decodable>(data: Data, response: URLResponse) throws -> T {
            guard let response = response as? HTTPURLResponse else {
                throw ApiError(
                    message: "Invalid HTTP response"
                )
            }
            switch response.statusCode {
            case 200...299:
                do {
                    return try JSONDecoder().decode(T.self, from: data)
                } catch {
                    if let apiError = try? JSONDecoder().decode(ApiError.self, from: data) {
                        throw apiError
                    }
                    throw ApiError(
                        statusCode: response.statusCode,
                        message: "Error decoding data"
                    )
                }
            default:
                if let apiError = try? JSONDecoder().decode(ApiError.self, from: data) {
                    throw apiError
                }
                
                guard let decodedError = try? JSONDecoder().decode(ApiError.self, from: data) else {
                    throw ApiError(
                        statusCode: response.statusCode,
                        message: "Unknown backend error"
                    )
                }
                
                throw ApiError(
                    statusCode: response.statusCode,
                    message: decodedError.message
                )
            }
        }
}
