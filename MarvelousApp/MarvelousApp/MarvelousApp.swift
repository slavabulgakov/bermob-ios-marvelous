import SwiftUI

@main
struct MarvelousApp: App {

  var body: some Scene {

    WindowGroup {
      makeSearchView()
    }
  }
}

// MARK: - Private factory helpers

private extension MarvelousApp {
  
  func makeSearchView() -> SearchView {
    let view = SearchView()

    return view
  }
}
