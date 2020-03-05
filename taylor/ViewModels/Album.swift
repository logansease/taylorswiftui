//
//  Album.swift
//  taylor
//
//  Created by lsease on 3/5/20.
//  Copyright © 2020 iParty Mobile. All rights reserved.
//

import Foundation
import UIKit

struct Album: Identifiable {
    var id = UUID()
    var name: String
    
    var imageName: String {
        return name.lowercased().replacingOccurrences(of: " ", with: "")
    }
}
