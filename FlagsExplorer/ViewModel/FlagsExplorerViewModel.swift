//
//  FlagsExplorerViewModel.swift
//  FlagsExplorer
//
//  Created by Ghenadie Isacenco on 6/11/25.
//

import Foundation

@Observable
class FlagsExplorerViewModel {
    let continents: [Continent] = [
        Continent(name: "Europe", description: "Historical landmarks and \ncultural diversity, \n oftern symbolized \nby the Union Jack \nor stars on blue."),
        Continent(name: "Africa", description: "Rich wildlife and\nancient civilizations, with\nflags showcasing vivid\ncolors, stars, and green."),
        Continent(name: "Americas", description: "Diverse cultures and\nvast landscapes, symbolized \n by flags with stars, stripes,\nand vibrant motifs."),
        Continent(name: "Asia", description: "Largest continent with\ndiverse cultures, represented\nby varied flags with\nred prominence."),
        Continent(name: "Oceania", description: "Unique wildlife and\n stunning landscapes, depicted\n in flags with the Southern\n Cross and oceanic themes.")
    ]
    
    var selectedCard: Int = 2
    var dragOffset: CGFloat = 0
}
