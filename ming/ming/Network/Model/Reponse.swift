//
//  Reponse.swift
//  ming
//
//  Created by 김윤서 on 2022/05/22.
//

import Foundation
struct Response: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [Miracle]
}

// MARK: - Datum
struct Miracle: Codable {
    let id, writer: String
    let content: [String]
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case writer, content, createdAt, updatedAt
    }
}
