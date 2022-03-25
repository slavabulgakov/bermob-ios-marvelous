import XCTest
@testable import MarvelAPI

class CharacterDataWrapperTests: XCTestCase {
  
  let jsonDecoder = JSONDecoder()
  var characterDataWrapper: CharacterDataWrapper!
  
  override func setUpWithError() throws {
    
    guard let urlString = Bundle.module.path(forResource: "CharacterDataWrapper", ofType: "json") else {
      fatalError("Test JSON does not exist!")
    }
    let url = URL(fileURLWithPath: urlString)
    let data = try Data(contentsOf: url)

    characterDataWrapper = try jsonDecoder.decode(CharacterDataWrapper.self, from: data)
  }
  
  func testCharacterDataWrapperHasTheCorrectCode() {
    
    let code = characterDataWrapper.code!
    
    XCTAssertNotNil(code, "A character data wrapper should have a code attribute when it is present.")
    XCTAssertEqual(code, 42, "A character data wrapper should have the correct code attribute when it is present.")
  }
  
  func testCharacterDataWrapperHasTheCorrectStatus() {
    
    let status = characterDataWrapper.status!
    
    XCTAssertNotNil(status, "A character data wrapper should have a status attribute when it is present.")
    XCTAssertEqual(status, "42", "A character data wrapper should have the correct status attribute when it is present.")
  }
  
  func testCharacterDataWrapperHasTheCorrectCopyright() {
    
    let copyright = characterDataWrapper.copyright!
    
    XCTAssertNotNil(copyright, "A character data wrapper should have a copyright attribute when it is present.")
    XCTAssertEqual(copyright, "© 2042 MARVEL",
                   "A character data wrapper should have the correct copyright attribute when it is present.")
  }
  
  func testCharacterDataWrapperHasTheCorrectAttributionText() {
    
    let attributionText = characterDataWrapper.attributionText!
    
    XCTAssertNotNil(attributionText, "A character data wrapper should have an attribution Text attribute when it is present.")
    XCTAssertEqual(attributionText, "Data provided by Marvel. © 2042 MARVEL",
                   "A character data wrapper should have the correct attribution Text attribute when it is present.")
  }
  
  func testCharacterDataWrapperHasTheCorrectAttributionHTML() {
    
    let attributionHTML = characterDataWrapper.attributionHTML!
    
    XCTAssertNotNil(attributionHTML, "A character data wrapper should have an attribution HTML attribute when it is present.")
    XCTAssertEqual(attributionHTML, "<a href=\"http://marvel.com\">Data provided by Marvel. © 2042 MARVEL</a>",
                   "A character data wrapper should have the correct attribution HTML attribute when it is present.")
  }
  
  func testCharacterDataWrapperHasTheCorrectEtag() {
    
    let etag = characterDataWrapper.etag!
    
    XCTAssertNotNil(etag, "A character data wrapper should have an etag attribute when it is present.")
    XCTAssertEqual(etag, "4242424242424242424242424242424242424242",
                   "A character data wrapper should have the correct etag attribute when it is present.")
  }
  
  func testCharacterDataWrapperHasTheCorrectData() {
    
    let data = characterDataWrapper.data!
    
    XCTAssertNotNil(data, "A character data wrapper should have an data attribute when it is present.")
  }
}
