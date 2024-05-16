import Foundation
import SwiftAPIClient

public extension BelurkAPI {

	var products: Products {
		Products(client: client("products"))
	}

	struct Products {

		public let client: APIClient

		public func getAll(
			startPage: Int = 0,
			perPage: Int = 100
		) async throws -> BelurkProductItems {
			try await client("get-all").get()
		}
	}
}
