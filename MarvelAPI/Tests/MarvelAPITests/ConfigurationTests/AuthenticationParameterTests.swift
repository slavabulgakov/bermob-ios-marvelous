import XCTest
@testable import MarvelAPI

class AuthenticationParameterTests: XCTestCase {
  
  let keyPair = KeyPair(publicKey: "APublicKey", privateKey: "APrivateKey")
  
  func testAuthenticationParametersHasTheCorrectTimeStamp() {
    
    let authenticationParameters = AuthenticationParameters(keyPair: keyPair, timeStamp: Date.distantFuture)
    
    let expectedTimeStamp = "64092211200.0" // String(Date.distantFuture.timeIntervalSince1970)
    XCTAssert(authenticationParameters.timeStamp == expectedTimeStamp, "It should have the correct time stamp.")
  }
  
  func testAuthenticationParametersHasTheCorrectPublicKey() {
    
    let authenticationParameters = AuthenticationParameters(keyPair: keyPair, timeStamp: Date.distantFuture)
    
    XCTAssert(authenticationParameters.publicKey == "APublicKey", "It should have the correct public key.")
  }
  
  func testAuthenticationParametersHasTheCorrectHash() {
    
    let authenticationParameters = AuthenticationParameters(keyPair: keyPair, timeStamp: Date.distantFuture)
    
    let expectedHash = "fdfb3d5dffe7e9c11056f7538316ccda" // md5(timestamp+privateKey+publicKey)
    XCTAssert(authenticationParameters.hash == expectedHash, "It should have the correct hash.")
  }
}
