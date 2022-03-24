// swift-tools-version: 5.6

import PackageDescription

let package = Package(
  name: "MarvelAPI",
  platforms: [.iOS(.v14), .macOS(.v10_15)],
  products: [
    .library(
      name: "MarvelAPI",
      targets: ["MarvelAPI"]),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "MarvelAPI",
      dependencies: []),
    .testTarget(
      name: "MarvelAPITests",
      dependencies: ["MarvelAPI"],
      resources: [
        .process("Resources/TestKeyPair.json")
      ]),
  ]
)
