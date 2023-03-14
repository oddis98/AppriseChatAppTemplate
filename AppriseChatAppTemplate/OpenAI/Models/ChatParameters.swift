//
//  ChatParameters.swift
//  AppriseChatAI
//
//  Created by Oddbjørn Almenning on 07/01/2023.
//

import Foundation

struct ChatParameters: Codable {
    var model: String
    var messages: [Message]
}

struct Message: Codable {
    var role: String
    var content: String
}
