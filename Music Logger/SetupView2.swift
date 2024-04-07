//
//  SetupView2.swift
//  Music Logger
//
//  Created by Sasha Bagrov on 06/04/2024.
//

import SwiftUI

struct SetupView2: View {
	@State private var notificationEnabled = false
	@State private var selectedTime = Date()
	
	var body: some View {
			Text("Notifications")
				.font(.title)
				.frame(maxWidth: .infinity, alignment: .topLeading)
				.padding()
			
			Toggle(isOn: $notificationEnabled) {
				Text("Enable practice notification")
			}
			.padding()
			
			DatePicker("Notification time", selection: $selectedTime, displayedComponents: .hourAndMinute)
				.disabled(!notificationEnabled) // Disable DatePicker based on toggle state
				.padding()
				.opacity(notificationEnabled ? 1 : 0.5) // Change opacity to indicate disabled state
			
			Spacer()
			
		//TODO: Add time for practice
		
			
			Button() {
				if notificationEnabled {
					// Schedule or edit the notification with the selected time
					scheduleNotification(for: selectedTime)
				} else {
					print("b")
				}
			} label: {
				Text("Finish setup")
			}
			.padding()
			.buttonStyle(.bordered)
	}
}

#Preview {
    SetupView2()
}
