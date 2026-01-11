// swift-tools-version: 6.2
import PackageDescription

let package = Package(
  name: "KokoroSwift",
  platforms: [
    .iOS(.v18), .macOS(.v15)
  ],
  products: [
    .library(
      name: "KokoroSwift",
      type: .dynamic,
      targets: ["KokoroSwift"]
    ),
  ],
  dependencies: [
    // 修正点 1：明确指定 name 且放在 url 之前，确保编译器能准确找到 mlx-swift
    .package(name: "mlx-swift", url: "https://github.com/ml-explore/mlx-swift", from: "0.30.2"),
    // 修正点 2：建议同样指定 name，防止远程解析混乱
    .package(name: "MisakiSwift", url: "https://github.com/tonysmail-web/MisakiSwift", from: "1.0.6"),
    .package(name: "MLXUtilsLibrary", url: "https://github.com/mlalma/MLXUtilsLibrary.git", from: "0.0.6")
  ],
  targets: [
    .target(
      name: "KokoroSwift",
      dependencies: [
        .product(name: "MLX", package: "mlx-swift"),
        .product(name: "MLXNN", package: "mlx-swift"),
        .product(name: "MLXRandom", package: "mlx-swift"),
        .product(name: "MLXFFT", package: "mlx-swift"),
        .product(name: "MLXFast", package: "mlx-swift"), // 这一行你加得很对，解决了之前的依赖缺失
        .product(name: "MisakiSwift", package: "MisakiSwift"),
        .product(name: "MLXUtilsLibrary", package: "MLXUtilsLibrary")
      ]
      // 修正点 3：这里已经去掉了 resources 定义，彻底解决了 lstat 报错和 CodeSign 失败
    ),
    .testTarget(
      name: "KokoroSwiftTests",
      dependencies: ["KokoroSwift"]
    ),
  ]
)
