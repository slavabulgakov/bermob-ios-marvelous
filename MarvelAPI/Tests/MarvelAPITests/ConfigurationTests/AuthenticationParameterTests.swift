import XCTest
@testable import MarvelAPI

class AuthenticationParameterTests: XCTestCase {
  
  let authenticationParameters = AuthenticationParameters(keyPair: KeyPair(publicKey: "APublicKey",
                                                                           privateKey: "APrivateKey"),
                                                          timeStamp: Date.distantFuture)
  
  func testAuthenticationParametersHasTheCorrectTimeStamp() {
    
    let expectedTimeStamp = "64092211200.0" // String(Date.distantFuture.timeIntervalSince1970)
    XCTAssert(authenticationParameters.timeStamp == expectedTimeStamp, "It should have the correct time stamp.")
  }
  
  func testAuthenticationParametersHasTheCorrectPublicKey() {
    
    XCTAssert(authenticationParameters.publicKey == "APublicKey", "It should have the correct public key.")
  }
  
  func testAuthenticationParametersHasTheCorrectHash() {
    
    let expectedHash = "fdfb3d5dffe7e9c11056f7538316ccda" // md5(timestamp+privateKey+publicKey)
    XCTAssert(authenticationParameters.hash == expectedHash, "It should have the correct hash.")
  }
}
