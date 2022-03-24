import Foundation

/// Containers for the results of a successful call.
public struct MarvelData: Decodable {
  
  /// The requested offset (number of skipped results) of the call.
  public let offset: Int?
  
  /// The requested result limit.
  public let limit: Int?
  
  /// The total number of resources available given the current filter set.
  public let total: Int?
  
  /// The total number of results returned by this call.
  public let count: Int?
  
  /// The list of characters returned by the call.
  public let results: [Character]?
}
