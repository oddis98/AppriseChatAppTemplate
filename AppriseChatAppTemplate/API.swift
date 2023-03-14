//
//  API.swift
//  AppriseChatAI
//
//  Created by Oddbjørn Almenning on 07/01/2023.
//

import Foundation

enum HTTPMethod: String {
    case post = "POST"
}

class API {
    private static func data(url: URL, method: HTTPMethod, apiKey: String, body: Data?) async throws -> Data {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = ["Content-Type": "application/json", "Authorization": "Bearer \(apiKey)"]
        request.httpBody = body
        return try await data(from: request)
    }

    private static func data(from request: URLRequest) async throws -> Data {
        try await withCheckedThrowingContinuation { (con: CheckedContinuation<Data, Error>) in
            URLSession.shared.dataTask(with: request) { data, _, error in
                if let error {
                    con.resume(throwing: error)
                } else if let data {
                    con.resume(returning: data)
                } else {
                    con.resume(returning: Data())
                }
            }.resume()
        }
    }

    private static func decodeData<T: Decodable>(_ type: T.Type = T.self, data: Data) async throws -> T {
        let decoder = JSONDecoder()

        if let decodedData = try? decoder.decode(type, from: data) {
            return decodedData
        }
        throw try decoder.decode(OpenAIErrorResponse.self, from: data)
    }

    static func run<T: Decodable>(
        _ type: T.Type = T.self,
        with url: URL,
        apiKey: String,
        httpBody: String?,
        method: HTTPMethod
    ) async throws -> T {
        let jsonData = httpBody?.data(using: .utf8)
        let data = try await data(url: url, method: method, apiKey: apiKey, body: jsonData)
        return try await decodeData(data: data)
    }
}
