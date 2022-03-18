# bermob-ios-marvelous
An iOS app to explore the Marvel API

### Documentation of API
The documentation of the Marvel API can be found here [Marvel API](https://developer.marvel.com/docs). You can also create your own developer credentials, like public/private keys if you like.

### Configuration
The configuration provides a very basic differentiation of the base URL that we are going to use for our api. It also provides a pair of public/private keys that we are going to use.

```swift
public enum ConfigurationType {
  case development
  case staging
  case release
}
```

```swift
let configuration = Configuration(type: .development)

configuration.baseURL() // Will return a URL type
configuration.secrets() // Will return a Secrets type with public/private keys
```
