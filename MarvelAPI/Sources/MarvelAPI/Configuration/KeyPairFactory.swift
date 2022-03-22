import Foundation

/// Create key pairs.
public final class KeyPairFactory {
  
  /// Create a new key pair factory.
  public init() {}

  /**
   Create a key pair from a local JSON file.
   - Parameters:
      - fileURL: The URL of the file containing the key pair.

   - Returns: A new key pair with data corresponding to the data in the file.

   The file must  use a `.json` extension and have the following format:
      
       {
         "publicKey": "somePublicKey",
         "privateKey": "somePrivateKey"
       }
  */
  public func makeKeyPair(fromFileURL fileURL: URL) -> KeyPair {
    
    let fileData = makeData(for: fileURL)
    let keyPair = makeKeyPair(from: fileData)
    
    return keyPair
  }
}

// MARK: - Private factory methods

// TODO: Is this the best way to handle these errors?
private extension KeyPairFactory {
  
  func makeData(for url: URL) -> Data {
    
    do {
      let data = try Data(contentsOf: url)
      return data
    }
    catch {
      fatalError(error.localizedDescription)
    }
  }
  
  func makeKeyPair(from data: Data) -> KeyPair {
    
    do {
      let keyPair = try JSONDecoder().decode(KeyPair.self, from: data)
      return keyPair
    }
    catch {
      fatalError(error.localizedDescription)
    }
  }
}
