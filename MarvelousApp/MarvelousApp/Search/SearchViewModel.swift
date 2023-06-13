//
//  SearchViewModel.swift
//  MarvelousApp
//
//  Created by Sergio Ruiz Pérez on 01.09.22.
//

import Foundation
import Combine
import MarvelAPI
import SwiftUI

// MARK: - Private helper functions

final class SearchViewModel: ObservableObject {
    
    @Published private(set) var characters = [Character]()
    
    private var cancellable = Set<AnyCancellable>()

    func getCharacters(term: String) {

      // Create credentials from JSON.
      guard let keyPairURLString = Bundle.main.path(forResource: "KeyPair", ofType: "json") else {
        fatalError("Test key pair does not exist")
      }

      // Use credentials to create authentication parameters.
      let keyPairURL = URL(fileURLWithPath: keyPairURLString)

      let keyPairFactory = KeyPairFactory()
      let keyPair = keyPairFactory.makeKeyPair(fromFileURL: keyPairURL)

      let authenticationParameters = AuthenticationParameters(keyPair: keyPair)

      // Create a new instance of the API with the authentication parameters.
      let marvelAPI = MarvelAPI(authenticationParameters: authenticationParameters)

      // Make a request to get characters named "3D-Man" and print the results.
      marvelAPI.getCharacters(term: term)
                  .sink(receiveCompletion: {_ in print("Request complete")},
                        receiveValue: {
                      
                      guard let dataWrapper = $0.data, let result = dataWrapper.results else {
                          return
                      }
                      self.characters = result
                      
                      self.characters.forEach { character in
                          print(character)
                      }
                  })
                  .store(in: &self.cancellable)
    }
}
