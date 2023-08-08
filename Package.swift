// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OneWinLibrary",
    defaultLocalization: "ru",
    platforms: [.macOS(.v13), .iOS(.v15)],
    products: [
        .library(name: "OneWinLibrary", targets: ["OneWinLibrary"]),
        .library(name: "IOSEntryPoint", targets: ["IOSEntryPoint"]),
        .library(name: "Utility", targets: ["Utility"]),
        .library(name: "Resources", targets: ["Resources"]),
        .library(name: "AppSettingsFeature", targets: ["AppSettingsFeature"]),
        .library(name: "WebViewFeature", targets: ["WebViewFeature"]),
        .library(name: "AuthorizationFeature", targets: ["AuthorizationFeature"]),
        .library(name: "Analytics", targets: ["Analytics"]),
        .library(name: "DesignSystem", targets: ["DesignSystem"]),
        .library(name: "APIClients", targets: ["APIClients"]),
        .library(name: "CountryListSelected", targets: ["CountryListSelected"]),
        .library(name: "DatabaseService", targets: ["DatabaseService"]),
        .library(name: "Services", targets: ["Services"]),
        .library(name: "MainScreen", targets: ["MainScreen"]),
        .library(name: "MenuScreen", targets: ["MenuScreen"]),
        .library(name: "WebimChat", targets: ["WebimChat"])
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", branch: "prerelease/1.0"),
        .package(url: "https://github.com/SFSafeSymbols/SFSafeSymbols", from: "4.0.0"),
        .package(url: "https://github.com/pointfreeco/combine-schedulers", from: "0.5.3"),
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", from: "6.6.0"),
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.50.4"),
        .package(url: "https://github.com/realm/SwiftLint", branch: "main"),
        .package(url: "https://github.com/amplitude/Amplitude-Swift", from: "0.4.0"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "10.4.0"),
        .package(url: "https://github.com/AppsFlyerSDK/AppsFlyerFramework.git", from: "6.9.0"),
        .package(url: "https://github.com/socketio/socket.io-client-swift.git", .upToNextMinor(from: "16.0.0")),
        .package(url: "https://github.com/Flight-School/AnyCodable.git", from: "0.6.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.6.4"),
        .package(url: "https://github.com/groue/GRDB.swift.git", branch: "master"),
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", .upToNextMajor(from: "2.0.0")),
        .package(url: "https://github.com/SDWebImage/SDWebImageSVGCoder.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/siteline/SwiftUI-Introspect.git", .upToNextMajor(from: "0.6.1")),
        .package(url: "https://github.com/kishikawakatsumi/KeychainAccess.git", .upToNextMajor(from: "4.2.2")),
        .package(url: "https://github.com/webim/webim-mobile-ui-ios", .upToNextMajor(from: "1.0.3")),
        .package(url: "https://github.com/apple/swift-docc-plugin", .upToNextMajor(from: "1.3.0"))
    ],
    targets: [
        .target(
            name: "OneWinLibrary",
            dependencies: [
                .product(name: "SFSafeSymbols", package: "SFSafeSymbols")
            ],
            plugins: [
                .plugin(name: "SwiftLintPlugin", package: "SwiftLint")
            ]
        ),
        .testTarget(
            name: "OneWinLibraryTests",
            dependencies: ["OneWinLibrary"]
        ),
        .testTarget(
            name: "AppSettingsFeatureTests",
            dependencies: [
                .product(name: "SocketIO", package: "socket.io-client-swift"),
                "AppSettingsFeature"
            ]
        ),
        .target(
            name: "IOSEntryPoint",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "SFSafeSymbols", package: "SFSafeSymbols"),
                "Utility",
                "Resources",
                "AppSettingsFeature",
                "WebViewFeature",
                "DesignSystem",
                "MainScreen",
                "MenuScreen",
            ],
            plugins: [
                .plugin(name: "SwiftLintPlugin", package: "SwiftLint")
            ]
        ),
        .target(name: "DesignSystem",
                dependencies: [
                    .product(name: "SFSafeSymbols", package: "SFSafeSymbols"),
                    .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                    .product(name: "SDWebImageSwiftUI", package: "SDWebImageSwiftUI"),
                    .product(name: "SDWebImageSVGCoder",package: "SDWebImageSVGCoder"),
                    .product(name: "SwiftUIIntrospect", package: "swiftui-introspect"),
                    "Utility",
                    "Resources",
                ]
               ),
        .target(name: "DatabaseService",
                dependencies: [.product(name: "GRDB", package: "GRDB.swift"),
                               .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                               "Utility",
						 		"KeychainAccess"]
               ),
        .target(
            name: "AuthorizationFeature",
            dependencies: [.product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                           .product(name: "SFSafeSymbols", package: "SFSafeSymbols"),
                           "Resources",
                           "DesignSystem",
                           "Utility",
                           "APIClients",
                           "CountryListSelected",
                           "Services"],
            plugins: [.plugin(name: "SwiftLintPlugin", package: "SwiftLint")]
        ),
        .target(
            name: "CountryListSelected",
            dependencies: [.product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                           .product(name: "SFSafeSymbols", package: "SFSafeSymbols"),
                           "Resources",
                           "DesignSystem",
                           "Utility"],
            plugins: [.plugin(name: "SwiftLintPlugin", package: "SwiftLint")]
        ),
        .target(
            name: "Utility",
            dependencies: [
                .product(name: "CombineSchedulers", package: "combine-schedulers"),
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "SocketIO", package: "socket.io-client-swift"),
                "AnyCodable",
                "Alamofire"
            ],
            plugins: [
                .plugin(name: "SwiftLintPlugin", package: "SwiftLint")
            ]
        ),
        .target(
            name: "Analytics",
            dependencies: [
                .product(name: "Amplitude-Swift", package: "Amplitude-Swift"),
                .product(name: "AppsFlyerLib", package: "AppsFlyerFramework"),
                .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
                .product(name: "FirebaseCrashlytics", package: "firebase-ios-sdk"),
                .product(name: "FirebasePerformance", package: "firebase-ios-sdk"),
                .product(name: "FirebaseRemoteConfigSwift", package: "firebase-ios-sdk")
            ],
            plugins: [
                .plugin(name: "SwiftLintPlugin", package: "SwiftLint")
            ]
        ),
        .target(name: "Resources",
                dependencies: [
                ],
                resources: [
                    .process("JSON"),
                    .process("LocalizationBackupResources")
                ],
                plugins: [
                    .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin"),
                    .plugin(name: "SwiftLintPlugin", package: "SwiftLint")
                ]
               ),
        .target(name: "AppSettingsFeature",
                dependencies: [
                    .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                    .product(name: "SFSafeSymbols", package: "SFSafeSymbols"),
                    "Utility",
                    "Resources",
                    "Services",
                    "WebimChat"
                ],
                plugins: [
                    .plugin(name: "SwiftLintPlugin", package: "SwiftLint")
                ]),
        .target(name: "WebViewFeature",
                dependencies: [
                    .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                    "Utility",
                    "Services"
                ],
                plugins: [
                    .plugin(name: "SwiftLintPlugin", package: "SwiftLint")
                ]),
        .target(
            name: "APIClients",
            dependencies: [
                .product(name: "SocketIO", package: "socket.io-client-swift"),
                "Utility",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]),
        .target(name: "MainScreen",
                dependencies: [
                    .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                    "Resources",
                    "DesignSystem",
                    "Utility",
                    "Services",
                    "AuthorizationFeature"
                ],
                plugins: [
                    .plugin(name: "SwiftLintPlugin", package: "SwiftLint")
                ]),
        .target(name: "Services",
                dependencies: [
                    .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                    "DatabaseService",
                    "APIClients",
                    "Resources",
  					"Utility"
                ],
                plugins: [
                    .plugin(name: "SwiftLintPlugin", package: "SwiftLint")
                ]),
        .target(name: "MenuScreen",
                dependencies: [
                    .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                    .product(name: "SFSafeSymbols", package: "SFSafeSymbols"),
                    .product(name: "SwiftUIIntrospect", package: "swiftui-introspect"),
                    "DesignSystem",
                    "AuthorizationFeature",
                    "Utility",
                    "Resources",
                    "CountryListSelected",
                    "Services",
                ],
                plugins: [
                    .plugin(name: "SwiftLintPlugin", package: "SwiftLint")
                ]),
        .target(name: "WebimChat",
                dependencies: [
                    .product(name: "WebimMobileWidget", package: "webim-mobile-ui-ios"),
                    "Resources"
                ],
                plugins: [
                    .plugin(name: "SwiftLintPlugin", package: "SwiftLint")
                ])
    ]
)
