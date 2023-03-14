//
//  ChatCompletionResponse.swift
//  AppriseChatAI
//
//  Created by Oddbjørn Almenning on 07/01/2023.
//

import Foundation

struct ChatCompletionResponse: Codable {
    let id: String
    let object: String
    let created: Int
    let choices: [ChatMessageChoice]
    let usage: Usage
}

struct ChatMessageChoice: Codable {
    let index: Int
    let message: Message
    let finishReason: String

    enum CodingKeys: String, CodingKey {
        case index
        case message
        case finishReason = "finish_reason"
    }
}

struct Usage: Codable {
    let promptTokens: Int
    let completionTokens: Int
    let totalTokens: Int

    enum CodingKeys: String, CodingKey {
        case promptTokens = "prompt_tokens"
        case completionTokens = "completion_tokens"
        case totalTokens = "total_tokens"
    }
}
