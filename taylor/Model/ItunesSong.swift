//
//  ItunesSongResult.swift
//  taylor
//
//  Created by lsease on 7/5/20.
//  Copyright © 2020 iParty Mobile. All rights reserved.
//

import Foundation

struct ItunesSongsResult: Codable {
    var results: [ItunesSong]
}

struct ItunesSong: Codable {
    var trackName: String?
    var wrapperType: String?
    var previewUrl: String?
}

// MARK: Array Helpers
// The below is some hackery so that we can extend an array of ItunesSong
protocol ItunesSongProtocol {
    associatedtype GenericType
}
extension ItunesSong: ItunesSongProtocol {
    typealias GenericType = Self
}

extension Array where Element: ItunesSongProtocol {
    func toSongs() -> [Song] {
        let itunesSongs = self as! [ItunesSong]
        
        var result: [Song] = []
        for itunesSong in itunesSongs.filter({$0.wrapperType == "track"}) {
            if let song = Song(itunesSong: itunesSong)
            {
                result.append(song)
            }
        }
        return result
    }
}
