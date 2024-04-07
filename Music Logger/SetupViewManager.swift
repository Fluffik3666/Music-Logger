//
//  SetupViewManager.swift
//  Music Logger
//
//  Created by Sasha Bagrov on 06/04/2024.
//

import SwiftUI

struct SetupViewManager: View {
	@State private var showSecondView = false
	
	var body: some View {
		ZStack {
			if showSecondView {
				SetupView2()
			} else {
				SetupView(showSecondView: $showSecondView)
			}
		}
		.animation(.easeOut, value: showSecondView)
		.transition(.slide)
	}
}

#Preview {
    SetupViewManager()
}
