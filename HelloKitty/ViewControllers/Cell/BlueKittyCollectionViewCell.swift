//
//  BlueKittyCollectionViewCell.swift
//  HelloKitty
//
//  Created by Богдан Баринов on 25.08.2022.
//

import UIKit

final class BlueKittyCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BlueKittyCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
