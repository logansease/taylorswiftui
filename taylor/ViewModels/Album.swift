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
    var id = UUID()
    var name: String
    var externalImageUrl: String?
    var date: Date?
    
    init?(itunesAlbum: ItunesAlbum) {
        guard itunesAlbum.collectionType == "Album",
            let name = itunesAlbum.collectionName,
            itunesAlbum.trackCount ?? 0 >= 10 else {
                return nil
        }
        
        self.name = name.capitalized
        self.date = itunesAlbum.releaseDate
        self.externalImageUrl = itunesAlbum.artworkUrl100
        if let collectionId = itunesAlbum.collectionId,
            let uuid = UUID(uuidString: "\(collectionId)") {
            id = uuid
        }
    }
    
    var imageName: String {
        return name.lowercased().replacingOccurrences(of: " ", with: "")
    }
}


