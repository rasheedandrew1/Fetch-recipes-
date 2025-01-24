//
//  RecipeModel.swift
//  Fetch(recipes)
//
//  Created by Rasheed on 1/24/25.
//

import Foundation

struct Recipe : Hashable,  Codable {
    let uuid, cuisine, name: String
    let photoUrlLarge, photoUrlSmall, sourceUrl, youtubeUrl: String?
    
    init(uuid: String, cuisine: String, name: String, photoUrlLarge: String? = nil, photoUrlSmall: String? = nil, sourceUrl: String? = nil, youtubeUrl: String? = nil)  {
        self.uuid = uuid
        self.cuisine = cuisine
        self.name = name
        self.photoUrlLarge = photoUrlLarge
        self.photoUrlSmall = photoUrlSmall
        self.sourceUrl = sourceUrl
        self.youtubeUrl = youtubeUrl
    }
    
    enum CodingKeys : String, CodingKey {
        case uuid = "uuid"
        case cuisine = "cuisine"
        case name = "name"
        case photoUrlLarge = "photo_url_large"
        case photoUrlSmall = "photo_url_small"
        case sourceUrl = "source_url"
        case youtubeUrl = "youtube_url"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.uuid = try container.decode(String.self, forKey: .uuid)
        self.cuisine = try container.decode(String.self, forKey: .cuisine)
        self.name = try container.decode(String.self, forKey: .name)
        self.photoUrlLarge = try container.decodeIfPresent(String.self, forKey: .photoUrlLarge)
        self.photoUrlSmall = try container.decodeIfPresent(String.self, forKey: .photoUrlSmall)
        self.sourceUrl = try container.decodeIfPresent(String.self, forKey: .sourceUrl)
        self.youtubeUrl = try container.decodeIfPresent(String.self, forKey: .youtubeUrl)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.uuid, forKey: .uuid)
        try container.encode(self.cuisine, forKey: .cuisine)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.photoUrlLarge, forKey: .photoUrlLarge)
        try container.encodeIfPresent(self.photoUrlSmall, forKey: .photoUrlSmall)
        try container.encodeIfPresent(self.sourceUrl, forKey: .sourceUrl)
        try container.encodeIfPresent(self.youtubeUrl, forKey: .youtubeUrl)
    }
}

