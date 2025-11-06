//
//  FlagsDetailsView.swift
//  FlagsExplorer
//
//  Created by Ghenadie Isacenco on 6/11/25.
//

import SwiftUI

struct FlagsDetailsView: View {
    var name: String
    
    fileprivate func BackButton() -> ToolbarItem<(), Button<some View>> {
        return ToolbarItem(placement: .navigationBarLeading) {
            Button {
                
            } label: {
                HStack {
                    Image(systemName: "chevron.left")
                }
                .foregroundStyle(.white)
            }
        }
    }
    
    var body: some View {
        ZStack {
            Image(.worldMap)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                
            VStack {
                Spacer()
                
                NavigationLink {
                    
                } label: {
                    VStack {
                        Spacer()
                        
                        HStack {
                            Text("QUIZ")
                                .font(.system(size: 50, weight: .bold, design: .default))
                            
                            Image(systemName: "gamecontroller")
                                .font(.system(size: 50, weight: .bold, design: .default))
                        }
                        .foregroundStyle(.white)
                        
                        Spacer()
                    }
                }
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: 100)
                .background(
                    LinearGradient(colors: [.orange, .orange, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
            }
            
            
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            if #available(iOS 26, *) {
                BackButton()
                .sharedBackgroundVisibility(.hidden)
            } else {
                BackButton()
            }
            
            ToolbarItem(placement: .principal) {
                Text(name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview("Detail") {
    NavigationView {
        FlagsDetailsView(name: "Europe")
    }
    
}

#Preview("Parent") {
    FlagsExplorerView()
}
