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
    private lazy var isBlueKittyButtonHidden = UIButton()

    
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
        isBlueKittyButtonHidden.isHidden = blueKitty.isKittyButtonHidden
    }
    
}

extension BlueKittyCollectionViewCell {
    
    private func configureUI() {
        contentView.addSubview(nameImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(isBlueKittyButtonHidden)
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.font = .systemFont(ofSize: 13, weight: .regular)
        isBlueKittyButtonHidden.setImage(UIImage(named: "Union"), for: .normal)
    }
    
    private func createConstraints() {
        
        nameImage.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(36)
            $0.trailing.equalToSuperview().inset(85)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(nameImage.snp.bottom).inset(8)
            $0.leading.bottom.trailing.equalToSuperview().offset(12)
        }
        
        isBlueKittyButtonHidden.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(13)
        }
        
    }
    
    
}
