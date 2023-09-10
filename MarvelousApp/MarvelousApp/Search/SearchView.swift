import Combine
import MarvelAPI
import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @State private var isResultShown = false
    @StateObject private var viewModel = ResultsViewModel()
  
    var body: some View {
      
      NavigationView {
          VStack {
              Text("")
                  .searchable(text: $searchText, prompt: "Search for a hero...")
                  .disableAutocorrection(true)
                  .navigationTitle("Marvel")
                  .disabled(viewModel.isLoading)
                  .onSubmit(of: .search) {
                      viewModel.getCharacters(term: searchText)
                  }
                                
              ResultView(viewModel: viewModel)
              
              Button(action: {
                  viewModel.getCharacters(term: searchText)
              }, label: {
                  Text("Search")
              })
              .font(.headline)
              .buttonStyle(.borderedProminent)
              .controlSize(.large)
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
