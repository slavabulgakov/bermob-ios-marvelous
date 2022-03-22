import CryptoKit
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
print(keyPair.publicKey)

let timestamp = String(Date().timeIntervalSince1970)

func generateHash(timestamp: String, keyPair: KeyPair) -> String {
  
  let string = timestamp + keyPair.privateKey + keyPair.publicKey
  
  guard let data = string.data(using: .utf8) else {
    /// TODO: Handle this error correctly...
    fatalError("Could not create data from string")
  }
  
  let digest = Insecure.MD5.hash(data: data)
  let digestString = digest.map { String(format: "%02hhx", $0) }.joined()
  
  return digestString
}

let baseURLString = "gateway.marvel.com"

func generateCharactersURL(baseURLString: String, timestamp: String, keyPair: KeyPair) -> URL {
  
  var components = URLComponents()
  components.scheme = "http"
  components.host = baseURLString
  components.path = "/v1/public/characters"
  components.queryItems = [
    URLQueryItem(name: "ts", value: timestamp),
    URLQueryItem(name: "apikey", value: keyPair.publicKey),
    URLQueryItem(name: "hash", value: generateHash(timestamp: timestamp, keyPair: keyPair))
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
                                timestamp: timestamp,
                                keyPair: keyPair)
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
