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
    var isKittyButtonHidden: Bool 
    
    init(imageName: String, title: String, isKittyButtonHidden: Bool) {
        self.imageName = imageName
        self.title = title
        self.isKittyButtonHidden = isKittyButtonHidden
    }
    
    
    static let mockBlueKitty = [
        
        BlueKitty(imageName: "Group1", title: "Buy & sell cats", isKittyButtonHidden: true),
        BlueKitty(imageName: "Group2", title: "Create collections", isKittyButtonHidden: false),
        BlueKitty(imageName: "Group3", title: "Breed adorable cats", isKittyButtonHidden: true)
        
    ]
}
