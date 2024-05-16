import Foundation

public struct BelurkProxyType: CodingKey, Codable, Hashable, ExpressibleByStringLiteral {

	public static let ipv4 = BelurkProxyType("ipv4")
	public static let ipv6 = BelurkProxyType("ipv6")
	public static let ipv4Shared = BelurkProxyType("ipv4_shared")

	public var stringValue: String
	public var intValue: Int? { nil }

	public init(stringValue: String) {
		self.stringValue = stringValue
	}

	public init(stringLiteral value: String) {
		self.init(value)
	}

	public init(_ value: String) {
		self.init(stringValue: value)
	}

	public init(from decoder: any Decoder) throws {
		try self.init(String(from: decoder))
	}

	public func encode(to encoder: any Encoder) throws {
		try stringValue.encode(to: encoder)
	}

	public init?(intValue: Int) {
		nil
	}
}
