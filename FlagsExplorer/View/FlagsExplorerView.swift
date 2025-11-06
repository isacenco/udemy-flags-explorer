//
//  FlagsExplorerView.swift
//  FlagsExplorer
//
//  Created by Ghenadie Isacenco on 6/11/25.
//

import SwiftUI

struct FlagsExplorerView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    .bg1,
                    .bg2
                ],
                startPoint: .top,
                endPoint: .bottom
            )
                .ignoresSafeArea()
                .overlay(
                    StarsBackground()
                )
            
            VStack {
                Text("Flags\nExplorer")
                    .font(Font.system(size: 50, weight: .heavy))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .shadow(radius: 10)
                    .padding()
                
                Spacer()
            }
        }
    }
}

struct StarsBackground: View {
    var body: some View {
        ZStack {
            ForEach(0..<30, id: \.self) { _ in
                Circle()
                    .fill(Color.randomPrime())
                    .frame(width: CGFloat.random(in: 2...10), height: CGFloat.random(in: 2...10))
                    .position(x: CGFloat.random(in: 0...UIScreen.main.bounds.width), y: CGFloat.random(in: 0...UIScreen.main.bounds.height))
            }
        }
    }
}

extension Color {
    static func randomPrime() -> Color {
        let primeColors: [Color] = [.white, .red, .yellow]
        return primeColors.randomElement() ?? .white
    }
}

#Preview {
    FlagsExplorerView()
}
