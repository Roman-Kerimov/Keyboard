//
//  LaunchAgent.swift
//  Keyboard macOS
//
//  Created by Roman Kerimov on 2018-04-20.
//

import AppKit

struct LaunchAgent {
    private init() {}
    
    private static var plistURL: URL {
        return URL.init(string: NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first!)!
            .appendingPathComponent("LaunchAgents")
            .appendingPathComponent(Bundle.main.bundleIdentifier! + ".plist")
    }
    
    private static func launchctl(_ arguments: String...) -> Bool {
        let task: Process = .init()
        task.launchPath = "/bin/launchctl"
        task.arguments = arguments
        
        let errorPipe: Pipe = .init()
        task.standardError = errorPipe
        
        task.launch()
        task.waitUntilExit()
        
        return errorPipe.fileHandleForReading.readDataToEndOfFile().isEmpty
    }
    
    static func load() {
        let labelKey: String = "Label"
        let programKey: String = "Program"
        let plistDictionary: NSDictionary? = NSDictionary.init(contentsOfFile: plistURL.absoluteString)
        let plistLabelValue: String? = plistDictionary?[labelKey] as? String
        let plistProgramValue: String? = plistDictionary?[programKey] as? String
        
        if plistLabelValue != Bundle.main.bundleIdentifier || plistProgramValue != Bundle.main.executablePath {
            unload()
            let launchAgentPlistDictionary: [String: Any] = [
                labelKey: Bundle.main.bundleIdentifier!,
                programKey: Bundle.main.executablePath!,
                "RunAtLoad": true,
                "KeepAlive": true,
            ]
            
            NSDictionary.init(dictionary: launchAgentPlistDictionary).write(toFile: plistURL.absoluteString, atomically: true)
        }
        
        if launchctl("load", plistURL.absoluteString) {
            NSApp.terminate(self)
        }
    }
    
    static func unload() {
        _ = launchctl("unload", plistURL.absoluteString)
    }
}
