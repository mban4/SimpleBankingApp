// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Results: Codable {
    let acounts: [Acount]
}

// MARK: - Acount
struct Acount: Codable {
    let id, iban, amount, currency: String
    let transactions: [Transaction]

    enum CodingKeys: String, CodingKey {
        case id
        case iban = "IBAN"
        case amount, currency, transactions
    }
}

// MARK: - Transaction
struct Transaction: Codable {
    let id, date, description, amount: String
    let type: String?
}


