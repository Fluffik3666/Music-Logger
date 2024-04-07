//
//  SetupView.swift
//  Music Logger
//
//  Created by Sasha Bagrov on 06/04/2024.
//

import SwiftUI

extension Color {
	static let lightShadow = Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
	static let darkShadow = Color(red: 163 / 255, green: 177 / 255, blue: 198 / 255)
	static let background = Color(red: 224 / 255, green: 229 / 255, blue: 236 / 255)
	static let neumorphictextColor = Color(red: 132 / 255, green: 132 / 255, blue: 132 / 255)
}

struct NeumorphicStyleTextField: View {
	var textField: TextField<Text>
	var imageName: String
	var body: some View {
		HStack {
			Image(systemName: imageName)
				.foregroundColor(.darkShadow)
			textField
			}
			.padding()
			.foregroundColor(.neumorphictextColor)
			.background(Color.background)
			.cornerRadius(6)
			.shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
			.shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)

		}
}


struct SetupView: View {
	@State var name = ""
	@Binding var showSecondView: Bool
	
    var body: some View {
		VStack {
			Text("Welcome to Music Logger!")
				.font(.largeTitle)
				.fontWeight(.bold)
				.frame(maxWidth: .infinity, alignment: .topLeading)
				.padding()
			
			VStack(alignment: .leading) {
				Text("How should we call you?")
					.font(.title2)
				HStack {
					NeumorphicStyleTextField(textField: TextField("Your name...", text: $name), imageName: "person")
				}
			}
			.padding()
			
			VStack(alignment: .leading) {
				Text("What instrument do you play?")
					.font(.title2)
				HStack {
					NeumorphicStyleTextField(textField: TextField("Instrument...", text: $name), imageName: "guitars")
				}
			}
			.padding()
			
			Spacer()
			
			Button {
				showSecondView = true
			} label: {
				Image(systemName: "arrow.right")
				Text("Next")
			}
			.buttonStyle(.bordered)
		}
    }
}
