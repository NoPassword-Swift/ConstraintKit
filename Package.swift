// swift-tools-version:5.0

import PackageDescription

let package = Package(
	name: "ConstraintKit",
	platforms: [
		.macOS("10.11"),
	],
	products: [
		.library(
			name: "ConstraintKit",
			targets: ["ConstraintKit"]),
	],
	targets: [
		.target(
			name: "ConstraintKit",
			dependencies: []),
	]
)
