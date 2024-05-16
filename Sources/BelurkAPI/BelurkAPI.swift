import Foundation
@_exported import SwiftAPIClient

/// https://dev.belurk.ru/get-token
public struct BelurkAPI {

	public var client: APIClient

	public init(
		client: APIClient = APIClient(),
		token: String
	) {
		self.client = client
			.url(URL(string: "https://api.belurk.com/")!)
			.auth(.apiKey(token, field: "x-api-token"))
			.errorDecoder(.decodable(BelurkError.self, dataDecoder: BelurkDecoder().decoder))
			.httpResponseValidator(.statusCode)
			.bodyDecoder(BelurkDecoder())
			.bodyEncoder(.json(dateEncodingStrategy: .iso8601, keyEncodingStrategy: .convertToSnakeCase))
			.queryEncoder(.urlQuery(dateEncodingStrategy: .iso8601, keyEncodingStrategy: .convertToSnakeCase))
	}
}
