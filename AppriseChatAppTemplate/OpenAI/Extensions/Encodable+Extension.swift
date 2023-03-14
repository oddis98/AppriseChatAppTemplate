//
//  Encodable+Extension.swift
//  AppriseChatAI
//
//  Created by Oddbjørn Almenning on 07/01/2023.
//

import Foundation

extension Encodable {
    func toJson() -> String? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
