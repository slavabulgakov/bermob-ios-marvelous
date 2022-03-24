import Foundation
import MarvelAPI
import PlaygroundSupport

let keyPairFactory = KeyPairFactory()

guard let keyPairURLString = Bundle.main.path(forResource: "KeyPair", ofType: "json") else {
  fatalError("Test key pair does not exist")
}

let keyPairURL = URL(fileURLWithPath: keyPairURLString)
let keyPair = keyPairFactory.makeKeyPair(fromFileURL: keyPairURL)
let authenticationParameters = AuthenticationParameters(keyPair: keyPair)

guard let url = Endpoint.searchCharacters(named: "3-D Man",
                                          withAuthenticationParameters: authenticationParameters).url else {
  fatalError("Invalid URL")
}
let urlRequest = URLRequest(url: url)

let session = URLSession.shared
session.dataTask(with: urlRequest) { (data, response, error) in

  guard let data = data else {
    print("No data")
    return
  }

  let decoder = JSONDecoder()
  // TODO: Don't force unwrap these...
  let decodedResponse = try! decoder.decode(CharacterDataWrapper.self, from: data)
  print(decodedResponse.data!)
}.resume()
