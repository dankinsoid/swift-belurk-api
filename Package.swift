// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "swift-belurk-api",
	platforms: [
		.macOS(.v10_15),
		.iOS(.v13),
		.tvOS(.v13),
		.watchOS(.v6),
	],
	products: [
		.library(name: "BelurkAPI", targets: ["BelurkAPI"]),
	],
	dependencies: [
		.package(url: "https://github.com/dankinsoid/swift-api-client.git", from: "1.11.1"),
	],
	targets: [
		.target(
			name: "BelurkAPI",
			dependencies: [
				.product(name: "SwiftAPIClient", package: "swift-api-client"),
			]
		),
		.testTarget(name: "BelurkAPITests", dependencies: ["BelurkAPI"]),
	]
)
