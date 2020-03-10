//
//  Album.swift
//  taylor
//
//  Created by lsease on 3/7/20.
//  Copyright © 2020 iParty Mobile. All rights reserved.
//

import Foundation

struct ItunesAlbum: Codable {
    var wrapperType: String?
    var collectionType: String?
    var collectionName: String?
    var artistName: String?
    var artistViewUrl: String?
    var artworkUrl60: String?
    var artworkUrl100: String?
    var releaseDate: Date?
    var trackCount: Int?
    
    var collectionId: Double?
    var amgArtistId: Double?
}

// MARK: Array Helpers
// The below is some hackery so that we can extend an array of ItunesAlbums
protocol ItunesAlbumProtocol {
    associatedtype GenericType
}
extension ItunesAlbum: ItunesAlbumProtocol {
    typealias GenericType = Self
}

extension Array where Element: ItunesAlbumProtocol {
    func toAlbums() -> [Album] {
        var result: [Album] = []
        for itunesAlbum in self {
            if let album = Album(itunesAlbum: itunesAlbum as! ItunesAlbum)
            {
                result.append(album)
            }
        }
        return result.sorted(by: {($0.date?.timeIntervalSince1970 ?? 0) > ($1.date?.timeIntervalSince1970 ?? 0)})
    }
}
