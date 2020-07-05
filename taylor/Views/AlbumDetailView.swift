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
    
    var body: some View {
        ZStack(alignment: .center) {
            Image("launch")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 20)
                .opacity(0.8)
            
            ImageUrlView(url: album.externalImageUrlEnlarged, defaultImage: nil)
                .aspectRatio(contentMode: .fit)

            AlbumDetailHeaderView(album: $album)
        }
        
    }
    
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let album = Album(name: "Fearless", date: Date())
        return AlbumDetailView(album: album)
    }
}
