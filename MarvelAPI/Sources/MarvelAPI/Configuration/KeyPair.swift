import Foundation

/// A public and private key pair.
public struct KeyPair: Decodable, Equatable {
  public let publicKey: String
  public let privateKey: String
}
