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

    let controller = SearchController()
    let view = SearchView(searchController: controller)

    return view
  }
}
