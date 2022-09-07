//
//  Card.swift
//  HelloKitty
//
//  Created by Богдан Баринов on 24.08.2022.
//

import Foundation
import UIKit

struct Card {
    
    var title: String
    var subTitle: String
    var imageName: String
    var color: UIColor
    var subTitleLabelTextColor: UIColor
    
    init(title: String, subTitle: String, imageName: String, color: UIColor, subTitleLabelTextColor: UIColor) {
        self.title = title
        self.subTitle = subTitle
        self.imageName = imageName
        self.color = color
        self.subTitleLabelTextColor = subTitleLabelTextColor
    }
    
    static let mockCardsData = [
        Card(title: "Learn how to play CryptoKitties!", subTitle: "These two Kitty cuties will join you for class.", imageName: "image 1", color: UIColor(red: 14 / 255, green: 0 / 255, blue: 255 / 255, alpha: 1), subTitleLabelTextColor: UIColor(red: 0.716, green: 0.7, blue: 1, alpha: 1)),
        Card(title: "What is CryptoKitties?", subTitle: "", imageName: "image 2", color: UIColor(red: 205 / 255, green: 46 / 255, blue: 138 / 255, alpha: 1), subTitleLabelTextColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
        Card(title: "Featured Collections", subTitle: "Check out these great Collections", imageName: "image 5", color: UIColor(red: 3 / 255, green: 181 / 255, blue: 82 / 255, alpha: 1), subTitleLabelTextColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.7))
    ]
}


