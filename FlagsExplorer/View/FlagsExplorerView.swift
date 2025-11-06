//
//  FlagsExplorerView.swift
//  FlagsExplorer
//
//  Created by Ghenadie Isacenco on 6/11/25.
//

import SwiftUI

struct FlagsExplorerView: View {
    @State var viewModel: FlagsExplorerViewModel = FlagsExplorerViewModel()
    
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
                
                ZStack {
                    ForEach(viewModel.continents.indices, id: \.self) { index in
                        let xOffset = CGFloat(index - viewModel.selectedCard) * 220 + viewModel.dragOffset
                        let scale = viewModel.selectedCard == index ? 1.2 : 0.8
                        let opacity = viewModel.selectedCard == index ? 1.0 : 0.8
                        
                        FlagsExplorerCard(
                            name: viewModel.continents[index].name,
                            description: viewModel.continents[index].description,
                            isSelected: true
                        )
                        .scaleEffect(scale)
                        .opacity(opacity)
                        .offset(x: xOffset, y: 0)
                    }
                }
                .gesture(
                    DragGesture()
                        .onEnded({ value in
                            withAnimation {
                                viewModel.updateSelectedCard(with: value)
                            }

                        })
                )
                
                Spacer()
            }
        }
    }
}

struct FlagsExplorerCard: View {
    let name: String
    let description: String
    let isSelected: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 60)
                .fill(.white)
                .shadow(radius: 10)
                .frame(width: 200, height: 250)
            
            VStack {
                Spacer()
                
                Image(name.lowercased())
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                    .shadow(radius: 20)
                
                Text(name)
                    .font(.title)
                    .bold()
                    .foregroundStyle(.bg1)
                    .shadow(radius: 10)
                
                Text(description)
                    .font(.system(size: 12))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 8)
                    .foregroundStyle(.gray)
                    .frame(width: 200)
                    
                if isSelected {
                    NavigationLink {
                        
                    } label: {
                        ZStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        colors: [
                                            .yellow,
                                            .yellow,
                                            .orange
                                        ],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 100, height: 100)
                            
                            Circle()
                                .stroke(.white, lineWidth: 10)
                                .frame(width: 100, height: 100)
                            
                            Image(systemName: "arrow.forward")
                                .foregroundStyle(.white)
                                .font(.system(size: 40, weight: .bold))
                        }
                    }
                }
                
                

            }
            .offset(y: isSelected ? -130 : -230)
        }
        //.frame(width: 200)
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
