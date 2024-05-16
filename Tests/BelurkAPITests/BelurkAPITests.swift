import BelurkAPI
import Foundation
import XCTest

final class BelurkAPITests: XCTestCase {

	let api = BelurkAPI(
		client: APIClient().loggingComponents(.full),
		token: ""
	)

	func testProxies() async throws {
		try await print(api.proxy.getAll().collect())
	}

	func testAccounts() async throws {
		try await print(api.accounts.getBalance())
	}

	func testProducts() async throws {
		try await print(api.products.getAll())
	}
}
