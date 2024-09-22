//
//  EndpointProvider.swift
//  Rides
//
//  Created by Anton Rybaiev on 2024-09-20.
//

import Foundation

protocol EndpointProvider {

    var scheme: String { get }
    var baseURL: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var token: String? { get }
    var queryItems: [URLQueryItem]? { get }
    var body: [String: Any]? { get }
}

extension EndpointProvider {

    var scheme: String {
        return "https"
    }

    var baseURL: String {
        return ApiConfig.baseUrl
    }

    func asURLRequest() throws -> URLRequest {

        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host =  baseURL
        urlComponents.path = path
        if let queryItems = queryItems {
            urlComponents.queryItems = queryItems
        }
        guard let url = urlComponents.url else {
            throw ApiError(message: "URL error")
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("true", forHTTPHeaderField: "X-Use-Cache")

        if !(token ?? "").isEmpty {
            urlRequest.addValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        }
        if let body = body {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
            } catch {
                throw ApiError(message: "Error encoding http body")
            }
        }
        return urlRequest
    }
}
