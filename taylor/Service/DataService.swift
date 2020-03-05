//
//  DataService.swift
//  taylor
//
//  Created by lsease on 3/5/20.
//  Copyright © 2020 iParty Mobile. All rights reserved.
//

import Foundation

class DataService: ObservableObject  {
    
    @Published var albums: [Album] = []
    
    class var shared: DataService {
        struct Singleton {
            static let instance = DataService()
        }
        return Singleton.instance
    }
    
    func loadAlbums() {
        var result: [Album] = []

        result.append(Album(name: "Lover"))
        result.append(Album(name: "Reputation"))
        result.append(Album(name: "1989"))
        result.append(Album(name: "Red"))
        result.append(Album(name: "Speak Now"))
        result.append(Album(name: "Fearless"))
        
        // TODO: Make network call
        
        self.albums = result
    }
    
}
