import Combine
import Foundation
import MarvelAPI

final class SearchController {
  
  private var cancellable = Set<AnyCancellable>()

  func getCharacters() {

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

    marvelAPI.getCharacters(named: "3D-Man")
                .sink(receiveCompletion: {_ in print("Request complete")},
                      receiveValue: { print($0) })
                .store(in: &self.cancellable)
  }
}
