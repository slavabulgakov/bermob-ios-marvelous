//
//  HeroesList.swift
//  MarvelousApp
//
//  Created by Sergio Ruiz Pérez on 01.09.22.
//

import SwiftUI

struct HeroesList: View {
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        List {
            ForEach(0..<viewModel.characters.count, id: \.self) { index in
                ItemHeroRow(hero: viewModel.characters[index])
            }
        }
    }
}

struct HeroesList_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SearchViewModel()
        HeroesList(viewModel: viewModel)
    }
}
