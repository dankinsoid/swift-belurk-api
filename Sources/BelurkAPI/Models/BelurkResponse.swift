import Foundation

public struct BelurkResponse<T> {

	public var data: T

	public init(data: T) {
		self.data = data
	}
}

extension BelurkResponse: Decodable where T: Decodable {}
extension BelurkResponse: Encodable where T: Encodable {}
extension BelurkResponse: Equatable where T: Equatable {}
extension BelurkResponse: Hashable where T: Hashable {}
extension BelurkResponse: Sendable where T: Sendable {}
