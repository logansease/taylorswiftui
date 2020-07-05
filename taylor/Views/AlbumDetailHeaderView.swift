//
//  AlbumDetailHeaderView.swift
//  taylor
//
//  Created by lsease on 7/5/20.
//  Copyright © 2020 iParty Mobile. All rights reserved.
//

import SwiftUI

struct AlbumDetailHeaderView: View {
    
    @Binding var album: Album
    @State var showSafari = false
    
    var body: some View {
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
                    
                    if self.album.externalLink != nil {
                        Button(action: {
                            self.showSafari = true
                        }) {
                            Text("See More  >")
                                .foregroundColor(.yellow)
                        }
                        // summon the Safari sheet
                        .sheet(isPresented: $showSafari) {
                            SafariView(url:URL(string: self.album.externalLink!)!)
                        }
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

struct AlbumDetailHeaderView_Previews: PreviewProvider {
    
    @State static var album = Album(name: "Fearless", date: Date(), externalLink: "https://google.com")
    
    static var previews: some View {
        
        return AlbumDetailHeaderView(album: AlbumDetailHeaderView_Previews.$album)
    }
}
