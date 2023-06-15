import XCTest
@testable import MarvelAPI

class CharacterTests: XCTestCase {
  
  let jsonDecoder = JSONDecoder()
  var character: Character!
  
  override func setUpWithError() throws {

    guard let urlString = Bundle.module.path(forResource: "Character", ofType: "json") else {
      fatalError("Test JSON does not exist!")
    }
    let url = URL(fileURLWithPath: urlString)
    let data = try Data(contentsOf: url)

    character = try jsonDecoder.decode(Character.self, from: data)
  }

  func testMarvelDataHasTheCorrectID() {

    let id = character.id!

    XCTAssertNotNil(id, "A marvel data should have an id attribute when it is present.")
    XCTAssertEqual(id, 42, "A character data wrapper should have the correct id attribute when it is present.")
  }
  
  func testMarvelDataHasTheCorrectName() {

    let name = character.name!

    XCTAssertNotNil(name, "A marvel data should have a name attribute when it is present.")
    XCTAssertEqual(name, "42 Man", "A character data wrapper should have the correct name attribute when it is present.")
  }
  
  func testMarvelDataHasTheCorrectDescription() {

    let description = character.description

    XCTAssertNotNil(description, "A marvel data should have an id attribute when it is present.")
    XCTAssertEqual(description, "ID: 42 Name: 42 Man Description: 42 Man 42")
  }
}


