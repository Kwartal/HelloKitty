//
//  BlueKittyCollectionViewCell.swift
//  HelloKitty
//
//  Created by Богдан Баринов on 25.08.2022.
//

import UIKit

final class BlueKittyCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BlueKittyCollectionViewCell"
    
    private lazy var nameImage = UIImageView()
    private lazy var titleLabel = UILabel()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        createConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(blueKitty: BlueKitty) {
        nameImage.image = UIImage(named: blueKitty.imageName)
        titleLabel.text = blueKitty.title
    }
    
}

extension BlueKittyCollectionViewCell {
    
    private func configureUI() {
        contentView.addSubview(nameImage)
    }
    
    private func createConstraints() {
        
        nameImage.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(36)
            $0.trailing.equalToSuperview().inset(85)
        }
        
    }
    
    
}
