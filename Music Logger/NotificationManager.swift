//
//  NotificationManager.swift
//  Music Logger
//
//  Created by Sasha Bagrov on 06/04/2024.
//

import Foundation
import UserNotifications

let practiceNotificationIdentifier = "dailyPracticeReminderNotification"

func requestNotificationPermission() {
	UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
		if granted {
			print("Notification permission granted.")
		} else if let error = error {
			print("Notification permission denied because: \(error.localizedDescription).")
		}
	}
}

func scheduleNotification(for time: Date) {
	stopNotification()
	
	let content = UNMutableNotificationContent()
	content.title = "Start a practice session"
	content.body = "Time to practice your instrument!"
	content.sound = UNNotificationSound.default


	// Extract only the hour and minute components from the selected time
	let triggerDateComponents = Calendar.current.dateComponents([.hour, .minute], from: time)
  
	// Create a trigger that repeats daily at the specified hour and minute
	let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDateComponents, repeats: true)

	// Create the request with the above content and trigger
	let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

	UNUserNotificationCenter.current().add(request) { error in
		if let error = error {
			print("Error scheduling notification: \(error.localizedDescription)")
		} else {
			print("Daily notification scheduled at \(triggerDateComponents.hour!):\(triggerDateComponents.minute!)")
		}
	}
}

func stopNotification() {
	UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [practiceNotificationIdentifier])
}

func editNotificationTime(to newTime: Date) {
	scheduleNotification(for: newTime)
}

