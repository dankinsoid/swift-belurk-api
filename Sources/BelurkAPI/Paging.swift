import Foundation
import SwiftAPIClient

public struct BelurkPages<Element: Decodable>: AsyncSequence {

	private var startPage: Int
	private var perPage: Int
	private let client: APIClient

	public init(startPage: Int = 0, perPage: Int = 100, client: APIClient) {
		self.startPage = startPage
		self.perPage = perPage
		self.client = client
	}

	public func makeAsyncIterator() -> AsyncIterator {
		AsyncIterator(currentPage: startPage + 1, maxPage: .max, perPage: perPage, client: client)
	}

	public struct AsyncIterator: AsyncIteratorProtocol {

		var currentPage: Int
		var maxPage: Int
		let perPage: Int
		let client: APIClient

		public mutating func next() async throws -> Element? {
			guard currentPage <= maxPage else { return nil }
			let result: BelurkPageData<Element> = try await client
				.query(["current_page": currentPage, "per_page": perPage])
				.call()
			currentPage = result.currentPage + 1
			maxPage = Swift.min(maxPage, result.totalPages)
			return result.items
		}
	}
}

private struct BelurkPageData<T: Decodable>: Decodable {

	var items: T
	var totalPages: Int
	var currentPage: Int
}

private struct BelurkPageRequest<T: Decodable>: Codable {

	var currentPage: Int
	var perPage: Int
}
