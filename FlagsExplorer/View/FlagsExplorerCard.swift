//
//  FlagsExplorerCard.swift
//  FlagsExplorer
//
//  Created by Ghenadie Isacenco on 6/11/25.
//

import SwiftUI

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
                        FlagsDetailsView()
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
    }
}
