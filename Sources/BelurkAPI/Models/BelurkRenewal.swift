import Foundation

public struct BelurkRenewal: Codable, Equatable {

	public var amount: Decimal
	public var count: Int
	public var periods: [BelurkRenewalPeriod]

	public init(amount: Decimal, count: Int, periods: [BelurkRenewalPeriod]) {
		self.amount = amount
		self.count = count
		self.periods = periods
	}
}

// MARK: - Period

public struct BelurkRenewalPeriod: Codable, Equatable {

	public var label, key: String

	public init(label: String, key: String) {
		self.label = label
		self.key = key
	}
}
