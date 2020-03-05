//
//  DetailView.swift
//  taylor
//
//  Created by lsease on 3/4/20.
//  Copyright © 2020 iParty Mobile. All rights reserved.
//

import SwiftUI

struct AlbumDetailView: View {
    
    @State var album: Album
    
    var body: some View {
        ZStack {
            Image(album.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
            Text(album.name)
        }
        
    }
    
}
