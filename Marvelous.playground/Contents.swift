import Foundation
import MarvelAPI

// Test creating a key pair here for now.
let keyPairFactory = KeyPairFactory()

guard let urlString = Bundle.main.path(forResource: "KeyPair", ofType: "json") else {
  fatalError("Test key pair does not exist!")
}

let url = URL(fileURLWithPath: urlString)
let keyPair = keyPairFactory.makeKeyPair(fromFileURL: url)
print(keyPair.publicKey)
