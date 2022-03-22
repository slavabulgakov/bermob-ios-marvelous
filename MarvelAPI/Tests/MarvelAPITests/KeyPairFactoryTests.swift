import XCTest
@testable import MarvelAPI

class KeyPairFactoryTests: XCTestCase {
  
  var keyPairFactory: KeyPairFactory?
  
  override func setUp() {
    keyPairFactory = KeyPairFactory()
  }
  
  override func tearDown() {
    keyPairFactory = nil
  }
}

// MARK: -

extension KeyPairFactoryTests {
  
  func testKeyPairFactoryCreatesKeyPairFromFileURL() {
    
    guard let urlString = Bundle.module.path(forResource: "TestKeyPair", ofType: "json") else {
      fatalError("Test key pair does not exist!")
    }
    
    let url = URL(fileURLWithPath: urlString)
    let keyPair = keyPairFactory?.makeKeyPair(fromFileURL: url)
    
    let referenceKeyPair = KeyPair(publicKey: "APublicKey", privateKey: "APrivateKey")
    XCTAssertEqual(keyPair, referenceKeyPair, "It should create the correct key pair.")
  }
}
