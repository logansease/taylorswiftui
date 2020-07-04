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
    
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let album = Album(name: "Fearless", date: Date())
        return AlbumDetailView(album: album)
    }
}
