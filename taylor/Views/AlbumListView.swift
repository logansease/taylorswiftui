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
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "lipstickRed")!]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(named: "lipstickRed")!]
    }
    
    var body: some View {
        NavigationView {
            List {
                Section(header:
                    Image("taylor-banner")
                        .frame(height: 300).clipped()
                        .shadow(color: Color("lipstickRed")
                            .opacity(0.2), radius: 6, x: 0, y: 8))
                {
                    ForEach(dataService.albums) { album in
                        self.albumRow(album)
                    }
                }
            }
            .navigationBarTitle(Text("Taylor SwiftUI"))
        }
        .onAppear() {
            DataService.shared.loadAlbums()
        }.accentColor(Color("lipstickRed"))
    }
    
    func albumRow(_ album: Album) -> some View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}
