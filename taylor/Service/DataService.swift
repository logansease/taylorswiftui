//
//  DataService.swift
//  taylor
//
//  Created by lsease on 3/5/20.
//  Copyright © 2020 iParty Mobile. All rights reserved.
//

import Foundation

class DataService: ObservableObject  {
    
    lazy var jsonDecoder = JSONDecoder()
    
    @Published var albums: [Album] = []
    @Published var songsByAlbum: [String: [Song]] = [:]
    
    class var shared: DataService {
        struct Singleton {
            static let instance = DataService()
        }
        return Singleton.instance
    }
    
    init() {
         jsonDecoder.dateDecodingStrategy = .iso8601
    }
    
    func loadAlbums() {
        
        guard let url = URL(string: "https://itunes.apple.com/lookup?id=159260351&entity=album") else {
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
                let decodedResponse = try? self.jsonDecoder.decode(ItunesAlbumResult.self, from: data)
            {
                DispatchQueue.main.async {
                    self.albums = decodedResponse.results.toAlbums()
                }
            }
            
        }.resume()
    }
    
    func loadSongs(for album: Album)
    {
        guard let url = URL(string: "https://itunes.apple.com/lookup?id=\(album.id)&entity=song") else {
            return
        }
               
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
           if let data = data,
               let decodedResponse = try? self.jsonDecoder.decode(ItunesSongsResult.self, from: data)
           {
               DispatchQueue.main.async {
                    let songs = decodedResponse.results.toSongs()
                    self.songsByAlbum[album.id] = songs
               }
           }
        }.resume()
    }
    
}
