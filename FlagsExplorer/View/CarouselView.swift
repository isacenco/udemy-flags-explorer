//
//  CarouselView.swift
//  FlagsExplorer
//
//  Created by Ghenadie Isacenco on 6/11/25.
//

import SwiftUI

struct CarouselView: View {
    @Binding var viewModel: FlagsExplorerViewModel
    
    var body: some View {
        
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
    }
}
