//
//  ContentView.swift
//  taylor
//
//  Created by lsease on 3/4/20.
//  Copyright © 2020 iParty Mobile. All rights reserved.
//

import SwiftUI

struct AlbumListView: View {
    
    @ObservedObject private var dataService = DataService.shared
    
    var body: some View {
        VStack {
            NavigationView {
                List(dataService.albums) { album in
                    NavigationLink(destination: AlbumDetailView(album: album) ) {
                        HStack {
                            ImageUrlView(url: album.externalImageUrl, defaultImage: nil)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .cornerRadius(30)
                            
                            Text(album.name)
                        }
                        
                    }
                }
            }
            .onAppear() {
                DataService.shared.loadAlbums()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}
