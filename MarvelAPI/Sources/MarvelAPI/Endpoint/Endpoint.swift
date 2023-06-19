import Foundation

// Model an endpoint of the API
struct Endpoint {
  
  /// The path to the endpoint.
  let path: String
  
  /// The query parameters of the endpoint.
  let queryItems: [URLQueryItem]
}

// MARK: - Factory methods for endpoints

extension Endpoint {
  
  /// Model an endpoint which returns characters matching the specified full character name (e.g. 3-D Man).
  ///
  /// - ToDo: Add additional parameters such as `nameStartsWith`, `orderBy`, and `limit`.
  static func getCharacters(named name: String,
                            withAuthenticationParameters authenticationParameters: AuthenticationParameters) -> Endpoint {
    return Endpoint(
      path: "/v1/public/characters",
      queryItems: [
        URLQueryItem(name: "nameStartsWith", value: name),
        URLQueryItem(name: "orderBy", value: "name"),
        URLQueryItem(name: "limit", value: "20"),
        URLQueryItem(name: "ts", value: authenticationParameters.timeStamp),
        URLQueryItem(name: "apikey", value: authenticationParameters.publicKey),
        URLQueryItem(name: "hash", value: authenticationParameters.hash)
      ]
    )
  }
}

// MARK: - Endpoint URLs

extension Endpoint {
  
  /// The URL of the endpoint.
  ///
  ///  - Note: Since the URL  components are dynamic and could be invalid the URL must be optional.
  var url: URL? {
    var components = URLComponents()
    components.scheme = "http"
    components.host = "gateway.marvel.com"
    components.path = path
    components.queryItems = queryItems
    
    return components.url
  }
}
