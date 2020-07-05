//
//  DetailView.swift
//  taylor
//
//  Created by lsease on 3/4/20.
//  Copyright © 2020 iParty Mobile. All rights reserved.
//

import SwiftUI
import SafariServices

struct AlbumDetailView: View {
    
    @State var album: Album
    @State var showSafari = false
    
    @ObservedObject private var dataService = DataService.shared
    
    var body: some View {
        ZStack(alignment: .center) {
            Image("launch")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 20)
                .opacity(0.8)
            
            VStack {
                AlbumDetailHeaderView(album: self.$album)
                
                ImageUrlView(url: self.album.externalImageUrlEnlarged, defaultImage: nil)
                    .aspectRatio(contentMode: .fit)
                    .shadow(color: Color("lipstickRed"), radius: 10)
                    .frame(maxWidth: 300, maxHeight: 300)
                
                self.songList
                
                Spacer()
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .onAppear() {
            DataService.shared.loadSongs(for: self.album)
        }
    }
    
    var songList: some View {
        HStack {
            Spacer()
        
            VStack {
                ForEach(DataService.shared.songsByAlbum[album.id] ?? []) { song in
                    Text(song.name).foregroundColor(.white)
                }
            }
                
            Spacer()
        }
        .background(Color(white: 0, opacity: 0.4))
        .cornerRadius(8)
    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let album = Album(name: "Fearless", date: Date())
        return AlbumDetailView(album: album)
    }
}

