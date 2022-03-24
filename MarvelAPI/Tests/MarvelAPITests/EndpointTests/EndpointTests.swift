import XCTest
@testable import MarvelAPI

class EndpointTests: XCTestCase {
  
  let authenticationParameters = AuthenticationParameters(keyPair: KeyPair(publicKey: "APublicKey",
                                                                           privateKey: "APrivateKey"),
                                                          timeStamp: Date.distantFuture)
  
  func testSearchCharcatersNamedEndpointURLIsCorrect() {
    let endpoint = Endpoint.searchCharacters(named: "Name",
                                             withAuthenticationParameters: authenticationParameters)
    let expectedURLString = "http://gateway.marvel.com/v1/public/characters?name=Name&ts=64092211200.0&apikey=APublicKey&hash=fdfb3d5dffe7e9c11056f7538316ccda"
    XCTAssertEqual(endpoint.url, URL(string: expectedURLString), "It should have the correct URL.")
  }
}
