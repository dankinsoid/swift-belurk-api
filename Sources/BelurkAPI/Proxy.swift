import Foundation
import SwiftAPIClient

public extension BelurkAPI {

	var proxy: Proxy {
		Proxy(client: client("proxy"))
	}

	struct Proxy {

		public let client: APIClient

		public func getAll(
			filterType: BelurkProxyFilterType = .all,
			startPage: Int = 0,
			perPage: Int = 100
		) -> BelurkPages<BelurkProxyItems> {
			BelurkPages(
				startPage: startPage,
				perPage: perPage,
				client: client("get-all")
					.query(BelurkProxyRequest(filters: BelurkProxyRequest.Filters(filterType: filterType)))
			)
		}

		@discardableResult
		public func createRenewal(
			type: BelurkProxyType,
			proxies: Set<Int>
		) async throws -> BelurkRenewal {
			try await client("create-renewal")
				.body(RenewProxiesRequest(proxyType: type, selectedProxy: proxies))
				.post()
		}
	}
}

public extension AsyncSequence where Element == BelurkProxyItems {

	func collect() async throws -> BelurkProxyItems {
		try await reduce(into: BelurkProxyItems()) { result, items in
			result.merge(items)
		}
	}
}

private struct BelurkProxyData: Codable {

	var items: BelurkProxyItems
	var totalPages: Int
	var currentPage: Int
}

private struct BelurkProxyRequest: Codable {

	var filters: Filters

	struct Filters: Codable {

		var filterType: BelurkProxyFilterType
	}
}

private struct RenewProxiesRequest: Codable {

	var proxyType: BelurkProxyType
	var selectedProxy: Set<Int>
}
