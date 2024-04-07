//
//  ContentView.swift
//  Music Logger
//
//  Created by Sasha Bagrov on 06/04/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
	var body: some View {
		TabView {
			Text("Home screen view")
				.tabItem {
					Image(systemName: "house")
					Text("Home")
			}
		
			Text("Log music session view")
				.tabItem {
					Image(systemName: "music.note")
					Text("Log Session")
						.padding()
			}
			
			Text("Settings view")
				.tabItem {
					Image(systemName: "gear")
					Text("Settings")
			}
		}

	}
}

#Preview {
    ContentView()
}
