import Foundation
import MarvelAPI
import PlaygroundSupport

// Test creating a key pair here for now.
let keyPairFactory = KeyPairFactory()

guard let keyPairURLString = Bundle.main.path(forResource: "KeyPair", ofType: "json") else {
  fatalError("Test key pair does not exist!")
}

let keyPairURL = URL(fileURLWithPath: keyPairURLString)
let keyPair = keyPairFactory.makeKeyPair(fromFileURL: keyPairURL)
let authenticationParameters = AuthenticationParameters(keyPair: keyPair)

let baseURLString = "gateway.marvel.com"

func generateCharactersURL(baseURLString: String, authenticationParameters: AuthenticationParameters) -> URL {

  var components = URLComponents()
  components.scheme = "http"
  components.host = baseURLString
  components.path = "/v1/public/characters"
  components.queryItems = [
    URLQueryItem(name: "ts", value: authenticationParameters.timeStamp),
    URLQueryItem(name: "apikey", value: authenticationParameters.publicKey),
    URLQueryItem(name: "hash", value: authenticationParameters.hash)
  ]

  // TODO: Don't force unwrap this...
  return components.url!
}

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

// MARK: - Session

let session = URLSession.shared
let url = generateCharactersURL(baseURLString: baseURLString,
                                authenticationParameters: authenticationParameters)
let urlRequest = URLRequest(url: url)

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
