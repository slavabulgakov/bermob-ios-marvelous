import CryptoKit
import Foundation

public struct AuthenticationParameters {
  
  private let keyPair: KeyPair
  private let ts: Date
  
  /// Create a new collection of authentication parameters.
  ///
  /// - Parameters:
  ///   - keyPair: A key pair associated with a Marvel developer account.
  ///   - timeStamp: A time associated with the authentication parameters.
  public init(keyPair: KeyPair, timeStamp: Date = Date()) {
    self.keyPair = keyPair
    self.ts = timeStamp
  }
  
  /// A timestamp which can change on a request-by-request basis.
  ///
  ///  - Note: This does not strictly need to be a Unix epoch timestamp. Rather, it can be any long string.
  public var timeStamp: String {
    String(ts.timeIntervalSince1970)
  }
  
  /// The public key of the Marvel developer account making the request.
  public var publicKey: String {
    keyPair.publicKey
  }
  
  /// An MD5 digest of the timestamp parameter, the private key, and the public key of the Marvel developer account making the request.
  ///
  /// - Note: The has should have the following format: `md5(timestamp+privateKey+publicKey)`
  public var hash: String {
    let string = timeStamp + keyPair.privateKey + keyPair.publicKey
    
    guard let data = string.data(using: .utf8) else {
      /// TODO: Handle this error correctly...
      fatalError("Could not create data from string")
    }
    
    let digest = Insecure.MD5.hash(data: data)
    let digestString = digest.map { String(format: "%02hhx", $0) }.joined()
    
    return digestString
  }
}
