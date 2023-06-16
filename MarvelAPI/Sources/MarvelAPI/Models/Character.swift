import Foundation

public struct Character: Decodable, CustomStringConvertible {
  
  /// The unique ID of the character resource.
  public let id: Int?
  
  /// The name of the character.
  public let name: String?
  
  ///  A short bio or description of the character.
  public let desc: String?
    
  enum CodingKeys: String, CodingKey {
      case id
      case name
      case desc = "description"
  }
    
  public var description: String {
    let id = self.id ?? 0
    let name = self.name ?? ""
    let desc = self.desc ?? ""
      
    return "ID: \(id) Name: \(name) Description: \(desc)"
  }

    public static func fixture(id: Int = 12341, name: String = "3D Man", desc: String = "Best hero ever") -> Character {
    return Character(id: id, name: name, desc: desc)
  }
    
  /// The date the resource was most recently modified.
  // let modified: Date?
  // TODO: Decode Dates
  
  /// The canonical URL identifier for this resource.
  // let resourceURI: URL?
  // TODO: Decode URLs
  
  /// A set of public web site URLs for the resource.
  // let urls: [Url]
  // TODO: Decode URLs
  
  /// The representative image for this character.
  // let thumbnail: Image
  // TODO: Add an Thumbnail type
  
  /// A resource list containing comics which feature this character.
  // let comics: ComicList?
  // TODO: Add an ComicList type
  
  /// A resource list of stories in which this character appears.
  // let stories: StoryList?
  // TODO: Add an StoryList type
  
  /// A resource list of events in which this character appears.
  // let events: EventList?
  // TODO: Add an EventList type
  
  /// A resource list of series in which this character appears.
  // let series: SeriesList?
  // TODO: Add an SeriesList type
}
