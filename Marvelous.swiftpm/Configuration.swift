import Foundation

public struct Configuration {

    /// Configuration type definition
    public enum ConfigurationType {
        case development
        case staging
        case release
    }

    /// Secrets struct that holds the public and private keys for the configuration.
    public struct Secrets {
        public let publicKey: String
        public let privateKey: String
    }

    private let type: ConfigurationType

    public init(type: Configuration.ConfigurationType) {
        self.type = type
    }

    /// Function that provides the base URL for the API layer based on the configuration type.
    /// - Returns: URL
    func baseURL() -> URL {
        switch type {
            case .development:
                guard let url = URL(string: "http://gateway.marvel.com/") else {
                    fallthrough
                }
                return url
            default:
                fatalError("Configuration: \(type), URL not found.")
        }
    }

    /// Function that provides the Secrets struct for Authorization based on the configuration type.
    /// - Returns: Secrets
    func secrets() -> Secrets {
        switch type {
            case .development:
                return Secrets(
                    publicKey: "037ca3b734eac674b3c89e2db22eafa1",
                    privateKey: "3378d48fe5cb4f3b8d090f3783cae03384de8560"
                )
            default:
                fatalError("Configuration: \(type), Secrets not found.")
        }
    }
}


