import Foundation

let projectURL = URL(fileURLWithPath: CommandLine.arguments[1])

FileManager.default.changeCurrentDirectoryPath(projectURL.path)

let projectName = projectURL.lastPathComponent

let sourceURL = URL(
    fileURLWithPath: "\(projectName).xcodeproj/project.xcworkspace/xcshareddata/swiftpm/Package.resolved"
)
let sourceData = try! Data(contentsOf: sourceURL)
let sourcePackageResolved = try! JSONDecoder().decode(PackageResolved.self, from: sourceData)

let sourceRevisionsByRepositoryURL = Dictionary(
    uniqueKeysWithValues: sourcePackageResolved.object.pins.map {($0.repositoryURL, $0.state.revision)}
)

let targetURL = URL(fileURLWithPath: "BuildUnicodeData/Package.resolved")
let targetData = try! Data(contentsOf: targetURL)
let targetPackageResolved = try! JSONDecoder().decode(PackageResolved.self, from: targetData)

var targetString = String(data: targetData, encoding: .utf8)!

targetPackageResolved.object.pins.forEach {
    targetString = targetString
        .replacingOccurrences(of: $0.state.revision, with: sourceRevisionsByRepositoryURL[$0.repositoryURL]!)
}

try! targetString.write(to: targetURL, atomically: true, encoding: .utf8)
