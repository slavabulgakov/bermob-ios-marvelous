import Combine
import MarvelAPI
import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
  
    var body: some View {
      
      NavigationView {
          VStack {
              Text("")
                  .searchable(text: $searchText, prompt: "Search for a hero...")
                  .disableAutocorrection(true)
                  .navigationTitle("Marvel")
              
              Spacer()
              
              NavigationLink(destination: ResultView(term: searchText)) {
                  Text("Search")
              }
              .font(.headline)
              .buttonStyle(.borderedProminent)
              .controlSize(.large)
              .navigationTitle("Search")
           }
        }
    }
}

// MARK: - Previews

struct ContentView_Previews: PreviewProvider {

  static var previews: some View {
    SearchView()
  }
}
