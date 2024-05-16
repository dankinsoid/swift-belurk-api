import Foundation
import SwiftAPIClient

public extension BelurkAPI {

	var orders: Orders {
		Orders(client: client("orders"))
	}

	struct Orders {

		public let client: APIClient

		@discardableResult
		public func create(
			productID: Int,
			quantity: Int = 1
		) async throws -> Int {
			try await client("create").post
				.call(.http, as: .decodable(CreateOrderResponse.self))
				.orderId
		}

		public func checkStatus(
			orderID: Int
		) async throws -> Bool {
			try await client("check-status").query("order_id", "\(orderID)")
				.call(.http, as: .decodable(CheckStatusResponse.self))
				.status
		}

		public func get(
			id: Int
		) async throws -> BelurkOrder {
			try await client(id).get()
		}
	}
}

private struct CreateOrderRequest: Codable {
	var productId, quantity: Int
}

private struct CreateOrderResponse: Codable {
	var orderId: Int
}

private struct CheckStatusResponse: Codable {
	var status: Bool
}
