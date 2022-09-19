//
//  PinkKitty.swift
//  HelloKitty
//
//  Created by Богдан Баринов on 29.08.2022.
//

import Foundation
import UIKit

struct PinkKitty {
    var imageName: String
    var title: String
    var isKittyButtonHidden: Bool
    
    init(imageName: String, title: String, isKittyButtonHidden: Bool) {
        self.imageName = imageName
        self.title = title
        self.isKittyButtonHidden = isKittyButtonHidden
    }
    
     static let mockPinkKitty = [
        
        PinkKitty(imageName: "pinkKitty1", title: "Hackatao", isKittyButtonHidden: false),
        PinkKitty(imageName: "pinkKitty2", title: "Onyx, Shale, Egyptiankohl", isKittyButtonHidden: false),
        PinkKitty(imageName: "pinkKitty3", title: "Kitties", isKittyButtonHidden: true)
        
    ]
    
}
