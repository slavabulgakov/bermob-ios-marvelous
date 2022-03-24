//
//  File.swift
//  
//
//  Created by James Banford on 24.03.22.
//

import Foundation

public struct Character: Decodable {
  
  /// The unique ID of the character resource.
  public let id: Int?
  
  /// The name of the character.
  public let name: String?
  
  ///  A short bio or description of the character.
  public let description: String?
  
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
