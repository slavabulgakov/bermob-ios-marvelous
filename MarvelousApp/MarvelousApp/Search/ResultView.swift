//
//  ResultView.swift
//  MarvelousApp
//
//  Created by Sergio Ruiz Pérez on 01.09.22.
//

import SwiftUI

struct ResultView: View {
    
    @ObservedObject var viewModel = ResultsViewModel()
    
    private let term: String
    
    init(term: String) {
        self.term = term
    }
    
    var body: some View {
        VStack {
            if viewModel.characters.isEmpty {
                ProgressView("Loading...")
            }            
            CharactersList(viewModel: viewModel)
        }
        .onAppear() {
            viewModel.getCharacters(term: term)
        }
        .navigationTitle("Heroes")
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(term: "Super")
    }
}
