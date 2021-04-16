
import Foundation

// MARK: GET시 사용
struct JsonBox: Codable {
    let data: [JsonCard]
    let error: String?
}

// MARK: response시 사용
struct JsonResponseBox: Codable {
    let data: JsonCard
    let error: String?
}

// MARK: Move시 사용
struct JsonMoveResponseBox: Codable {
    let data: JsonMoveResponseCard
    let error: String?
}

// MARK: post시 사용
struct postJsonCard: Codable {
    let title: String
    let content: String
    let columnType: String
}

// MARK: Box 내부 Card
struct JsonCard: Codable {
    let id, user: Int
    let title, content: String
    let priority: Double
    let columnType: String
    let deleted: Bool
}

// MARK: History 부분

struct JsonHistoryBox: Codable {
    let data: [JsonHistory]
    let error: String?
}

struct JsonHistory: Codable {
    let cardTitle: String
    let action: String
    let date: String
    let from: String?
    let to: String?

struct JsonMoveResponseCard: Codable {
    let id: Int
    let title, content: String
    let priority: Double
    let columnType: String
    let deleted: Bool
    let rebalanced: Bool
}

// MARK: Edit시 보내는 구조
struct JsonEditCard: Codable {
    let title: String
    let content: String
    let priority: Double
}
