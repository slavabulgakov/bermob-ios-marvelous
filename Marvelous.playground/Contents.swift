import Foundation
import MarvelAPI
import PlaygroundSupport

// Test creating a key pair here for now.
let keyPairFactory = KeyPairFactory()

guard let keyPairURLString = Bundle.main.path(forResource: "KeyPair", ofType: "json") else {
  fatalError("Test key pair does not exist")
}

let keyPairURL = URL(fileURLWithPath: keyPairURLString)
let keyPair = keyPairFactory.makeKeyPair(fromFileURL: keyPairURL)
let authenticationParameters = AuthenticationParameters(keyPair: keyPair)

// MARK: - Models

struct MarvelResponse: Decodable {
  let data: MarvelData
}

struct MarvelData: Decodable {
  let results: [MarvelCharacter]
}

struct MarvelCharacter: Decodable, CustomStringConvertible {
  
  let id: Int
  let name: String
  
  var description: String {
    "ID: \(id), Name: \(name)"
  }
}

// MARK: - Make a request

guard let url = Endpoint.searchCharacters(named: "3-D Man",
                                          withAuthenticationParameters: authenticationParameters).url else {
  fatalError("Invalid URL")
}
let urlRequest = URLRequest(url: url)

let session = URLSession.shared
session.dataTask(with: urlRequest) { (data, response, error) in

  guard let data = data else {
    print("No data :/")
    return
  }

  let decoder = JSONDecoder()
  // TODO: Don't force unwrap this...
  let decodedResponse = try! decoder.decode(MarvelResponse.self, from: data)
  print(decodedResponse.data.results)
}.resume()
