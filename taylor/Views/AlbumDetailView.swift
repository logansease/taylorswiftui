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
        ZStack(alignment: .center) {
            Image("launch")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 30)
                .opacity(0.7)
            
            ImageUrlView(url: album.externalImageUrl, defaultImage: UIImage(named: "cat"))
                .aspectRatio(contentMode: .fit)

            VStack() {
                HStack(alignment: .center){
                    Spacer()
                    VStack {
                        Text(album.name)
                            .font(.callout)
                            .padding(6)
                        
                        if album.dateString != nil {
                            Text(album.dateString!)
                                .font(.callout)
                                .padding(6)
                        }
                    }
                    Spacer()
                }.background(Color.black)
                .opacity(0.8)
                .cornerRadius(10.0)
                .padding(6)
                .foregroundColor(.white)
                
                Spacer()
            }
        }
        
    }
    
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let album = Album(name: "Fearless", date: Date())
        return AlbumDetailView(album: album)
    }
}
