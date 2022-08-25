//
//  BlueKitty.swift
//  HelloKitty
//
//  Created by Богдан Баринов on 25.08.2022.
//

import Foundation
import UIKit

struct BlueKitty {
    var imageName: String
    var title: String
    
    init(imageName: String, title: String) {
        self.imageName = imageName
        self.title = title
    }


static let mockBlueKitty = [
    
        BlueKitty.init(imageName: "", title: "Buy & sell cats"),
        BlueKitty.init(imageName: "", title: "Buy & sell cats"),
        BlueKitty.init(imageName: "", title: "Buy & sell cats")

    ]
}
