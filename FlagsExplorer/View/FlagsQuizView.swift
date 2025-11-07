//
//  FlagsQuizView.swift
//  FlagsExplorer
//
//  Created by Ghenadie Isacenco on 7/11/25.
//

import SwiftUI

struct FlagsQuizView: View {
    @Environment(\.dismiss) var dismiss
    
    var name: String = "Europe"
    var countries: [CountryElement] = []
    
    
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
                .ignoresSafeArea(.all)
            
        }
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

#Preview {
    NavigationView {
        FlagsQuizView(name: "Europe", countries: [
            CountryElement(name: Name(common: "Norway"), flags: Flags(png: "https://flagcdn.com/w320/no.png")),
            CountryElement(name: Name(common: "Greece"), flags: Flags(png: "https://flagcdn.com/w320/gr.png")),
            CountryElement(name: Name(common: "Åland Islands"), flags: Flags(png: "https://flagcdn.com/w320/ax.png")),
            CountryElement(name: Name(common: "Switzerland"), flags: Flags(png: "https://flagcdn.com/w320/ch.png")),
            CountryElement(name: Name(common: "Croatia"), flags: Flags(png: "https://flagcdn.com/w320/hr.png")),
            CountryElement(name: Name(common: "Iceland"), flags: Flags(png: "https://flagcdn.com/w320/is.png")),
            CountryElement(name: Name(common: "Luxembourg"), flags: Flags(png: "https://flagcdn.com/w320/lu.png")),
            CountryElement(name: Name(common: "Hungary"), flags: Flags(png: "https://flagcdn.com/w320/hu.png")),
            CountryElement(name: Name(common: "Netherlands"), flags: Flags(png: "https://flagcdn.com/w320/nl.png")),
            CountryElement(name: Name(common: "Lithuania"), flags: Flags(png: "https://flagcdn.com/w320/lt.png")),
            CountryElement(name: Name(common: "Liechtenstein"), flags: Flags(png: "https://flagcdn.com/w320/li.png")),
        ])
    }
}
