//
//  PinkKittyCollectionViewCell.swift
//  HelloKitty
//
//  Created by Богдан Баринов on 29.08.2022.
//

import UIKit

final class PinkKittyCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PinkKittyCollectionViewCell"
    
    private lazy var nameImage = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var isPinkKittyButtonHidden = UIButton()


    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        createConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(pinkKitty: PinkKitty) {
        nameImage.image = UIImage(named: pinkKitty.imageName)
        titleLabel.text = pinkKitty.title
        isPinkKittyButtonHidden.isHidden = pinkKitty.isKittyButtonHidden
    }

}

// MARK: - Layout

extension PinkKittyCollectionViewCell {

    private func configureUI() {
        contentView.addSubview(nameImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(isPinkKittyButtonHidden)
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.font = .systemFont(ofSize: 13, weight: .regular)
        
        isPinkKittyButtonHidden.setImage(UIImage(named: "Union"), for: .normal)
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
        
        isPinkKittyButtonHidden.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(13)
        }
    }

}
