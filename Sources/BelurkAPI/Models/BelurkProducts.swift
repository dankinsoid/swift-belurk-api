import Foundation

public struct BelurkProductItems: Codable, ExpressibleByDictionaryLiteral {

	public var values: [BelurkProxyType: BelurkProduct]

	public subscript(_ type: BelurkProxyType) -> BelurkProduct? {
		get { values[type] }
		set { values[type] = newValue }
	}

	public init(dictionaryLiteral elements: (BelurkProxyType, BelurkProduct)...) {
		self.init(Dictionary(elements) { _, new in new })
	}

	public init(_ values: [BelurkProxyType: BelurkProduct] = [:]) {
		self.values = values
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: BelurkProxyType.self)
		values = [:]
		for key in container.allKeys {
			values[key] = try container.decode(BelurkProduct.self, forKey: key)
		}
	}

	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: BelurkProxyType.self)
		for (key, value) in values {
			try container.encode(value, forKey: key)
		}
	}
}

public struct BelurkProduct: Codable, Equatable {

	public var name: String
	public var variants: [BelurkProductVariant]

	public init(name: String, variants: [BelurkProductVariant]) {
		self.name = name
		self.variants = variants
	}
}

public struct BelurkProductVariant: Codable, Equatable, Identifiable {

	public var variantId: Int
	public var period: String
	public var price: Decimal
	public var speed: Double
	public var country: String
	public var countryCode: String
	public var countryIcon: String
	///    public var discount: null?
	public var maxQuantity: Int

	public var id: Int { variantId }

	public init(
		variantId: Int,
		period: String,
		price: Decimal,
		speed: Double,
		country: String,
		countryCode: String,
		countryIcon: String,
		maxQuantity: Int
	) {
		self.variantId = variantId
		self.period = period
		self.price = price
		self.speed = speed
		self.country = country
		self.countryCode = countryCode
		self.countryIcon = countryIcon
		self.maxQuantity = maxQuantity
	}
}
