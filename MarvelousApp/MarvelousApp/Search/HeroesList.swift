//
//  CharactersList.swift
//  MarvelousApp
//
//  Created by Sergio Ruiz Pérez on 01.09.22.
//

import SwiftUI

struct CharactersList: View {
    @ObservedObject var viewModel: ResultsViewModel
    
    var body: some View {
        List {
            ForEach(0..<viewModel.characters.count, id: \.self) { index in
                ItemHeroRow(hero: viewModel.characters[index])
            }
        }.listStyle(.plain)
    }
}

struct CharactersList_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ResultsViewModel()
        CharactersList(viewModel: viewModel)
    }
}
