//
//  Album.swift
//  taylor
//
//  Created by lsease on 3/5/20.
//  Copyright © 2020 iParty Mobile. All rights reserved.
//

import Foundation
import UIKit

struct Album: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var externalImageUrl: String?
    var date: Date?
    var appleMusicLink: String?
    
    init?(itunesAlbum: ItunesAlbum) {
        guard itunesAlbum.collectionType == "Album",
            let name = itunesAlbum.collectionName,
            itunesAlbum.trackCount ?? 0 >= 10 else {
                return nil
        }
        
        self.name = name.capitalized
        self.date = itunesAlbum.releaseDate
        self.externalImageUrl = itunesAlbum.artworkUrl100
        self.appleMusicLink = itunesAlbum.collectionViewUrl

        if let collectionId = itunesAlbum.collectionId {
            self.id = String(format: "%.0f", collectionId)
        }
    }
    
    init(name: String, externalImageUrl: String? = nil, date: Date? = nil, appleMusicLink: String? = nil) {
        self.name = name
        self.externalImageUrl = externalImageUrl
        self.date = date
        self.appleMusicLink = appleMusicLink
    }
    
    var imageName: String {
        return name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    var dateString: String? {
        guard let date = date else { return nil }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
    
    var externalImageUrlEnlarged: String? {
        externalImageUrl?.replacingOccurrences(of: "100x100", with: "1000x1000")
    }
}


