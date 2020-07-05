//
//  Song.swift
//  taylor
//
//  Created by lsease on 7/5/20.
//  Copyright © 2020 iParty Mobile. All rights reserved.
//

import Foundation

struct Song: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var previewUrl: String?
    
    init?(itunesSong: ItunesSong) {
        guard let name = itunesSong.trackName else {
            return nil
        }
        self.name = name
        self.previewUrl = itunesSong.previewUrl
    }
}
