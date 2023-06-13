import Combine
import Foundation

public class MarvelAPI {
  
  private let authenticationParameters: AuthenticationParameters
  private let jsonDecoder: JSONDecoder
  private let urlSession: URLSession
  
  /// Create a new representation of the Marvel API.
  ///
  ///  - parameters:
  ///    - jsonDecoder: A JSON decoder used to decode responses. A new instance will be created by default.
  ///    - urlSession: A URLSession decoder used to make HTTP requests. The shared instance will be used by default.
  ///    - authenticationParameters: The authentication parameters required to make a request.
  ///
  ///  - Note: This implementation is far for complete. It only allows requests to be made to one endpoint (and even then does not allow the complete list of query parameters to be used). Please see the TODOs for suggested improvements.
  public init(jsonDecoder: JSONDecoder = JSONDecoder(),
              urlSession: URLSession = URLSession.shared,
              authenticationParameters: AuthenticationParameters) {
    
    self.jsonDecoder = jsonDecoder
    self.urlSession = urlSession
    self.authenticationParameters = authenticationParameters
  }
  
  /// Return only characters matching the specified full character name (e.g. 3-D Man).
  ///
  /// - ToDo: Add additional parameters such as `nameStartsWith`, `orderBy`, and `limit`.
  public func getCharacters(term: String) -> AnyPublisher<CharacterDataWrapper, Error> {
    
    guard let url = Endpoint.getCharacters(named: term,
                                           withAuthenticationParameters: authenticationParameters).url else {
      fatalError("Invalid URL")
    }
    let urlRequest = URLRequest(url: url)
    
    // TODO: Extract common aspects of making a request into a separate HTTP client.
    return urlSession.dataTaskPublisher(for: urlRequest)
      .tryMap() { element -> Data in
        guard let httpResponse = element.response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
          throw URLError(.badServerResponse)
        }
        return element.data
      }
      .decode(type: CharacterDataWrapper.self, decoder: JSONDecoder())
    // TODO: Should this always receive on the main thread or should that be the responsibility of the caller?
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
  
  // TODO: Add the complete set of API endpoints.
}
