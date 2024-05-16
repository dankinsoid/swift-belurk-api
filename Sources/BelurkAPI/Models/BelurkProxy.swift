import Foundation

public struct BelurkProxyItems: Codable, ExpressibleByDictionaryLiteral, Equatable {

	public var values: [BelurkProxyType: [BelurkProxy]]

	public subscript(_ type: BelurkProxyType) -> [BelurkProxy] {
		get { values[type] ?? [] }
		set { values[type] = newValue }
	}

	public init(dictionaryLiteral elements: (BelurkProxyType, [BelurkProxy])...) {
		self.init(Dictionary(elements, uniquingKeysWith: +))
	}

	public init(_ values: [BelurkProxyType: [BelurkProxy]] = [:]) {
		self.values = values
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: BelurkProxyType.self)
		values = [:]
		for key in container.allKeys {
			values[key] = try container.decode([BelurkProxy].self, forKey: key)
		}
	}

	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: BelurkProxyType.self)
		for (key, value) in values {
			try container.encode(value, forKey: key)
		}
	}

	public func merging(_ other: BelurkProxyItems) -> BelurkProxyItems {
		BelurkProxyItems(values.merging(other.values, uniquingKeysWith: +))
	}

	public mutating func merge(_ other: BelurkProxyItems) {
		values.merge(other.values, uniquingKeysWith: +)
	}
}

public struct BelurkProxy: Codable, Equatable {

	public var credentialId: String
	public var productId: Int
	public var login: String
	public var password: String
	public var ipAddress: String
	public var type: BelurkProxyType
	public var country: BelurkProxyCountry
	public var expiredAt: Date
	public var isExpired: Bool
	public var ports: BelurkPorts
	public var speed: BelurkProxySpeed

	public init(credentialId: String, productId: Int, login: String, password: String, ipAddress: String, type: BelurkProxyType, country: BelurkProxyCountry, expiredAt: Date, isExpired: Bool, ports: BelurkPorts, speed: BelurkProxySpeed) {
		self.credentialId = credentialId
		self.productId = productId
		self.login = login
		self.password = password
		self.ipAddress = ipAddress
		self.type = type
		self.country = country
		self.expiredAt = expiredAt
		self.isExpired = isExpired
		self.ports = ports
		self.speed = speed
	}
}

public struct BelurkProxyCountry: Codable, Equatable {

	public var code: String
	public var label: String?

	public init(code: String, label: String? = nil) {
		self.code = code
		self.label = label
	}
}

public struct BelurkPorts: Codable, Equatable {

	public var http: Int
	public var socks: Int?

	public init(http: Int, socks: Int? = nil) {
		self.http = http
		self.socks = socks
	}
}

public struct BelurkProxySpeed: Codable, Equatable {

	public var value: Double
	public var unit: String

	public init(value: Double, unit: String) {
		self.value = value
		self.unit = unit
	}
}

public struct BelurkProxyFilterType: Codable, Hashable {

	public var value: String

	public static let all = BelurkProxyFilterType("all")

	public init(_ value: String) {
		self.value = value
	}

	public init(from decoder: Decoder) throws {
		value = try decoder.singleValueContainer().decode(String.self)
	}

	public func encode(to encoder: Encoder) throws {
		try value.encode(to: encoder)
	}
}
