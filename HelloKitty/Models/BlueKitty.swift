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
    
        BlueKitty.init(imageName: "Group1", title: "Buy & sell cats"),
        BlueKitty.init(imageName: "Group2", title: "Create collections"),
        BlueKitty.init(imageName: "Group3", title: "Breed adorable cats")

    ]
}
