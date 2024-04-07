//
//  AppIconChangerView.swift
//  Music Logger
//
//  Created by Sasha Bagrov on 07/04/2024.
//

import SwiftUI

struct AppIconChangerView: View {
	let appIcons:[String] = ["AppIcon","AppIcon 1","AppIcon 2","AppIcon 3","AppIcon 4","AppIcon 5", "AppIcon 6"]
	var body: some View {
		List{
			ForEach(appIcons,id: \.self) { name in
				Button {
					UIApplication.shared.setAlternateIconName(name)
				} label: {
					Text(name)
						.fontWeight(.bold)
				}
			}
		}
	}
}

#Preview {
    AppIconChangerView()
}
