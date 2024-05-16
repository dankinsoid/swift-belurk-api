import Foundation
import SwiftAPIClient

public struct BelurkDecoder: DataDecoder {

	let decoder: JSONDecoder

	public init() {
		decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .iso8601
		decoder.keyDecodingStrategy = .convertFromSnakeCase
	}

	public func decode<T>(_ type: T.Type, from data: Data) throws -> T where T: Decodable {
		try decoder.decode(BelurkResponse<T>.self, from: data).data
	}
}
