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
    
}
