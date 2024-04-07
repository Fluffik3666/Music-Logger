//
//  Music_LoggerApp.swift
//  Music Logger
//
//  Created by Sasha Bagrov on 06/04/2024.
//

import SwiftUI

@main
struct Music_LoggerApp: App {
	
	init() {
		requestNotificationPermission()
		requestMicrophonePermission()
	}
	
	
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
