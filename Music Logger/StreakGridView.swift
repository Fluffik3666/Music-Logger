//
//  StreakGridView.swift
//  Music Logger
//
//  Created by Sasha Bagrov on 06/04/2024.
//

import SwiftUI

struct StreakGridView: View {
	var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 7) // 7 for a week view
	let currentMonthDays: Int = Calendar.current.range(of: .day, in: .month, for: Date())?.count ?? 30
	@State private var highlightedDays: [Int] = UserDefaults.standard.array(forKey: "highlightedDays") as? [Int] ?? []
	
	var body: some View {
		ScrollView {
			LazyVGrid(columns: columns, spacing: 10) {
				ForEach(1...currentMonthDays, id: \.self) { day in
					Text("\(day)")
						.frame(width: 30, height: 30)
						.background(highlightedDays.contains(day) ? Color.orange : Color.gray.opacity(0.3))
						.cornerRadius(5)
				}
			}
			.padding()
		}
		.onAppear {
			highlightedDays = UserDefaults.standard.array(forKey: "highlightedDays") as? [Int] ?? []
		}
	}
	
	func highlightDay(dayNum: Int) {
		if !highlightedDays.contains(dayNum) {
			highlightedDays.append(dayNum)
			UserDefaults.standard.set(highlightedDays, forKey: "highlightedDays")
		}
	}
	
	func clearHighlightedDays() {
		highlightedDays.removeAll()
		UserDefaults.standard.removeObject(forKey: "highlightedDays")
	}
}

#Preview {
    StreakGridView()
}
