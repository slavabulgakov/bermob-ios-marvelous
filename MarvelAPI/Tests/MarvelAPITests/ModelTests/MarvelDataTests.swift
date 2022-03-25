import XCTest
@testable import MarvelAPI

class MarvelDataTests: XCTestCase {
  
  let jsonDecoder = JSONDecoder()
  var marvelData: MarvelData!
  
  override func setUpWithError() throws {

    guard let urlString = Bundle.module.path(forResource: "MarvelData", ofType: "json") else {
      fatalError("Test JSON does not exist!")
    }
    let url = URL(fileURLWithPath: urlString)
    let data = try Data(contentsOf: url)

    marvelData = try jsonDecoder.decode(MarvelData.self, from: data)
  }

  func testMarvelDataHasTheCorrectOffset() {

    let offset = marvelData.offset!

    XCTAssertNotNil(offset, "A marvel data should have an offset attribute when it is present.")
    XCTAssertEqual(offset, 42,
                   "A character data wrapper should have the correct offset attribute when it is present.")
  }
  
  func testMarvelDataHasTheCorrectLimit() {

    let limit = marvelData.limit!

    XCTAssertNotNil(limit, "A marvel data should have a limit attribute when it is present.")
    XCTAssertEqual(limit, 42,
                   "A character data wrapper should have the correct limit attribute when it is present.")
  }
  
  
  func testMarvelDataHasTheCorrectTotal() {

    let total = marvelData.total!

    XCTAssertNotNil(total, "A marvel data should have a total attribute when it is present.")
    XCTAssertEqual(total, 42,
                   "A character data wrapper should have the correct total attribute when it is present.")
  }
  
  
  func testMarvelDataHasTheCorrectCount() {

    let count = marvelData.count!

    XCTAssertNotNil(count, "A marvel data should have a count attribute when it is present.")
    XCTAssertEqual(count, 42,
                   "A character data wrapper should have the correct count attribute when it is present.")
  }
  
  
  func testMarvelDataHasTheCorrectResults() {

    let results = marvelData.results!

    XCTAssertNotNil(results, "A marvel data should have an results attribute when it is present.")
  }
}
