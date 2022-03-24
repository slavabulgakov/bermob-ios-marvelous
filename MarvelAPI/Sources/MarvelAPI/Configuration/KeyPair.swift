import Foundation

/// A key pair associated with a Marvel developer account.
public struct KeyPair: Decodable, Equatable {
  
  /// The public key.
  public let publicKey: String
  
  /// The private key.
  public let privateKey: String
}
