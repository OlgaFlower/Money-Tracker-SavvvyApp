//
//  AudioPlayer.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 24.06.24.
//

import Foundation
import AVFoundation

final class AudioPlayer: ObservableObject {
    
    private var player = AVAudioPlayer()
    
    func playSound(for soundCase: SoundType) {
        player.prepareToPlay()
        
        let path = Bundle.main.path(forResource: soundCase.resource, ofType: soundCase.type)!
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            //player.setVolume(volume, fadeDuration: 0) /// setup loudness of the sound
        } catch {
            // TODO: add handling error
            print("ERROR getting audio \(error.localizedDescription)")
        }
        player.play()
    }
}

extension AudioPlayer {
    enum SoundType {
        case expenses
        case income
        case chart
        
        var resource: String {
            switch self {
            case .expenses:
                return "cashRegisterSound"
            case .income:
                return "incomeSound"
            case .chart:
                return "gameCoinSound"
            }
        }
        
        var type: String {
            switch self {
            case .expenses:
                return "mp3"
            case .income:
                return "mp3"
            case .chart:
                return "mp3"
            }
        }
    }
}
