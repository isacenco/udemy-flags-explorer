//
//  FlagsDetailsView.swift
//  FlagsExplorer
//
//  Created by Ghenadie Isacenco on 6/11/25.
//

import SwiftUI

struct FlagsDetailsView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var flagsDetailViewModel: FlagsDetailViewModel = FlagsDetailViewModel()
    
    var name: String
    var columns: [GridItem] = [
        GridItem(.flexible(minimum: 100, maximum: 200)),
        GridItem(.flexible(minimum: 100, maximum: 200))
    ]
    
    fileprivate func BackButton() -> ToolbarItem<(), Button<some View>> {
        return ToolbarItem(placement: .navigationBarLeading) {
            Button {
                dismiss()
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
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(flagsDetailViewModel.countries, id: \.id) { country in
                            VStack {
                                AsyncImage(url: URL(string: country.flags.png)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        
                                } placeholder: {
                                    ProgressView()
                                }
                                
                                Text(country.name.common)
                                    .font(.title3)
                                    .foregroundStyle(.white)
                            }
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(10)
                            .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 5)
                            
                        }
                    }
                    .task {
                        await flagsDetailViewModel.getCountriesByContinent(continent: name)
                    }
                }
                
                NavigationLink {
                    FlagsQuizView(name: name, countries: flagsDetailViewModel.countries)
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
