//
//  OpenAI.swift
//  AppriseChatAI
//
//  Created by Oddbjørn Almenning on 07/01/2023.
//

import Foundation

enum AIMode: String {
    case helpful
    case sassy

    var value: String { "You are a \(rawValue) assistant." }
}

class OpenAI {
    private var organization: String
    private var apiKey: String

    init(organization: String, apiKey: String) {
        self.organization = organization
        self.apiKey = apiKey
    }

    private let baseUrl: String = "https://api.openai.com/v1"

    private func serverUrl(with path: String) -> URL? {
        return URL(string: "\(baseUrl)\(path)")
    }

    public func chat(_ params: ChatParameters) async throws -> ChatCompletionResponse {
        guard let url = serverUrl(with: "/chat/completions") else { throw OpenAIError.invalidUrl }
        guard let json = params.toJson() else { throw OpenAIError.invalidData }
        return try await API.run(with: url, apiKey: apiKey, httpBody: json, method: .post)
    }
}
