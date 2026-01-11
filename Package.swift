// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "KokoroSwift",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "KokoroSwift",
            targets: ["KokoroSwift"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/tonysmail-web/MisakiSwift",
            branch: "main"
        ),
        .package(
            url: "https://github.com/ml-explore/mlx-swift",
            from: "0.7.0"
        )
    ],
    targets: [
        .target(
            name: "KokoroSwift",
            dependencies: [
                "MisakiSwift",
                .product(name: "MLX", package: "mlx-swift"),
                .product(name: "MLXNN", package: "mlx-swift")
            ]
            // ❌ 注意：没有 resources
        ),
        .testTarget(
            name: "KokoroSwiftTests",
            dependencies: ["KokoroSwift"]
        )
    ]
)
