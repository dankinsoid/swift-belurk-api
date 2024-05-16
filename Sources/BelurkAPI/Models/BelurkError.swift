import Foundation

public struct BelurkError: LocalizedError, Decodable, Sendable, CustomStringConvertible {

	public var error: String
	public var description: String { error }
	public var errorDescription: String? { description }

	public init(error: String) {
		self.error = error
	}
}
