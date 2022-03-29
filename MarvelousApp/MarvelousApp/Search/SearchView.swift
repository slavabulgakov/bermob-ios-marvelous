import Combine
import MarvelAPI
import SwiftUI

struct SearchView: View {
  
  // TODO: Add a view model to complement this controller.
  private var searchController: SearchController?
  
  init(searchController: SearchController? = nil) {
    
    self.searchController = searchController
  }
  
  var body: some View {

    // TODO: Add a mechanism to capture a character search term and show a list of characters based on the response.
    Text("Hello, Marvel API!")
      .onAppear {
        getCharacters()
      }
      .padding()
  }
}

// MARK: - Private helper functions

private extension SearchView {
  
  func getCharacters() {
    searchController?.getCharacters()
  }
}

// MARK: - Previews

struct ContentView_Previews: PreviewProvider {

  static var previews: some View {
    SearchView()
  }
}
