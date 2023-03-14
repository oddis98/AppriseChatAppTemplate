//
//  OpenAIError.swift
//  AppriseChatAI
//
//  Created by Oddbjørn Almenning on 07/01/2023.
//

import Foundation

struct OpenAIErrorResponse: Error, Codable {
    let error: OpenAIErrorMessage
}

struct OpenAIErrorMessage: Error, Codable {
    let message: String
    let type: String
    let param: String?
    let code: String?
}

enum OpenAIError: Error {
    case invalidUrl
    case invalidData
}
