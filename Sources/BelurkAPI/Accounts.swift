import Foundation
import SwiftAPIClient

extension BelurkAPI {

	public var accounts: Accounts {
		Accounts(client: client("accounts"))
	}

	public struct Accounts {

		public let client: APIClient

		public func getBalance() async throws -> Decimal {
			let string = try await client("get-balance")
				.call(.http, as: .decodable(BalanceResponse.self))
				.balance
			guard let balance = Decimal(string: string) else {
				throw DecodingError.dataCorrupted(
					DecodingError.Context(
						codingPath: BalanceKeys.allCases,
						debugDescription: "Invalid balance string: \(string)"
					)
				)
			}
			return balance
		}
	}

	private enum BalanceKeys: String, CodingKey, CaseIterable {
		case data, balance
	}

	private struct BalanceResponse: Decodable {
		let balance: String
	}
}
