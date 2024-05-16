import Foundation

public struct BelurkOrder: Codable, Equatable, Identifiable {

	public var id: Int
	public var status: Status
	public var isReady: Bool
	public var type: OrderType
	public var amount: Decimal
	public var items: [BelurkProxy]

	public init(id: Int, status: Status, isReady: Bool, type: OrderType, amount: Decimal, items: [BelurkProxy]) {
		self.id = id
		self.status = status
		self.isReady = isReady
		self.type = type
		self.amount = amount
		self.items = items
	}

	public enum Status: Int, Codable, Hashable {

		case unsuccessful = -1
		case successful = 1
		case waitingForPayment = 2
		case expired = 3
	}

	public enum OrderType: Int, Codable, Hashable {

		case balanceReplenishment = -1
		case renewal = 2
		case purchase = 3
		case systemRenewal = 4
		case systemBalanceReplenishment = 5
	}
}
