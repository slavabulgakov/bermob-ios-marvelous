//
//  ResultView.swift
//  MarvelousApp
//
//  Created by Sergio Ruiz Pérez on 01.09.22.
//

import SwiftUI

struct ResultView: View {
    
    @ObservedObject var viewModel: ResultsViewModel
    
    var body: some View {
        ZStack {
            CharactersList(viewModel: viewModel)
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .padding(10)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 5))
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(viewModel: ResultsViewModel())
    }
}
