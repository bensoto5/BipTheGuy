//
//  ContentView.swift
//  BipTheGuy
//
//  Created by SOTO, BENJAMIN on 4/9/26.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer!
    @State private var isFullSize = true
    
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "clown")
                .resizable()
                .scaledToFit()
                .scaleEffect(isFullSize ? 1.0 : 0.9)
                .onTapGesture {
                    playSound(soundName: "punchSound")
                    isFullSize = false // will immediately  shrink using .scaleEffect to 90% size
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.3)) {
                        isFullSize = true // will go from 90% to 100% size but using the .spring animation
                    }
                }
            
            Spacer()
            
            Button{
                //TODO: Button action here
            }label: {
                Label("Photo Library", systemImage: "photo.fill.on.rectangle.fill")
            }
        }
        .padding()
    }
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else { print("😡 Could not read file named \(soundName)")
            return
        }
        do{
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 ERROR: \(error.localizedDescription)creating audioPlayer")
        }
    }
}
#Preview {
    ContentView()
}
