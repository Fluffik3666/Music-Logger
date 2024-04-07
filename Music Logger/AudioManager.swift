//
//  AudioManager.swift
//  Music Logger
//
//  Created by Sasha Bagrov on 07/04/2024.
//

import Foundation
import AVFoundation


func requestMicrophonePermission() {
	switch AVAudioSession.sharedInstance().recordPermission {
	case .undetermined:
		AVAudioSession.sharedInstance().requestRecordPermission { granted in
			if granted {
				print("Microphone permission granted.")
			} else {
				print("Microphone permission denied.")
			}
		}
	case .denied:
		print("Microphone permission denied.")
	case .granted:
		print("Microphone permission granted.")
	@unknown default:
		break
	}
}

class AudioRecorder: NSObject, AVAudioRecorderDelegate {
	var audioRecorder: AVAudioRecorder?
	
	func startRecording() {
		let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")
		
		let settings = [
			AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
			AVSampleRateKey: 12000,
			AVNumberOfChannelsKey: 1,
			AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
		]
		
		do {
			audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
			audioRecorder?.delegate = self
			audioRecorder?.record()
		} catch {
			finishRecording(success: false)
		}
	}
	
	func finishRecording(success: Bool) {
		audioRecorder?.stop()
		audioRecorder = nil
		
		if success {
			print("Recording finished successfully.")
		} else {
			print("Recording failed or was stopped.")
		}
	}
	
	func getDocumentsDirectory() -> URL {
		let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return paths[0]
	}
}



class AudioPlayer: NSObject, AVAudioPlayerDelegate {
	var audioPlayer: AVAudioPlayer?
	
	func startPlaying() {
		let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")
		
		do {
			audioPlayer = try AVAudioPlayer(contentsOf: audioFilename)
			audioPlayer?.delegate = self
			audioPlayer?.play()
		} catch {
			print("Could not load file for playback.")
		}
	}
	
	func getDocumentsDirectory() -> URL {
		let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return paths[0]
	}
}

