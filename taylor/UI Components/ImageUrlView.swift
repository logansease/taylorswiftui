//
//  SwiftUIView.swift
//  taylor
//
//  Created by lsease on 7/3/20.
//  Copyright © 2020 iParty Mobile. All rights reserved.
//

import SwiftUI
import UIKit

struct ImageUrlView: View {
    @ObservedObject var remoteImageModel: RemoteImage
    static let blankImage = Image(systemName: "slowmo")

    init(url: String?, defaultImage: UIImage?) {
        remoteImageModel = RemoteImage(imageUrl: url, defaultImage: defaultImage)
    }
    
    var body: some View {
        remoteImageModel.displayImage == nil ?
            ImageUrlView.blankImage :
        Image(uiImage: remoteImageModel.displayImage!)
            .resizable()
    }
}

struct ImageUrlView_Previews: PreviewProvider {
    static var previews: some View {
        ImageUrlView(url: "https://saucemonsters.com/wp-content/uploads/2017/06/Taylor-Swift-01.jpg", defaultImage: nil)
    }
}
