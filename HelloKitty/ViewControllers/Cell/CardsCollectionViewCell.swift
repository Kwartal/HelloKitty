//
//  CardsCollectionViewCell.swift
//  HelloKitty
//
//  Created by Богдан Баринов on 24.08.2022.
//

import UIKit

final class CardsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CardsCollectionViewCell"

    private lazy var mainCardTitleLabel = UILabel()
    private lazy var subCardTitleLabel = UILabel()
    private lazy var cardImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        createConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(card: Card) {
        mainCardTitleLabel.text = card.title
        subCardTitleLabel.text = card.subTitle
        subCardTitleLabel.textColor = card.subTitleLabelTextColor
        cardImage.image = UIImage(named: card.imageName)
        contentView.backgroundColor = card.color
    }
}

// MARK: - Layout

extension CardsCollectionViewCell {

    private func configureUI() {
        contentView.addSubview(mainCardTitleLabel)
        contentView.addSubview(subCardTitleLabel)
        contentView.addSubview(cardImage)
        
        mainCardTitleLabel.numberOfLines = 0
        mainCardTitleLabel.adjustsFontSizeToFitWidth = true
        mainCardTitleLabel.textColor = .white
        mainCardTitleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        
        subCardTitleLabel.numberOfLines = 0
        subCardTitleLabel.adjustsFontSizeToFitWidth = true
        subCardTitleLabel.textColor = .white
        subCardTitleLabel.textColor = UIColor(red: 0.716, green: 0.7, blue: 1, alpha: 1)

        subCardTitleLabel.font = .systemFont(ofSize: 12, weight: .regular)
        cardImage.contentMode = .center
    }

    private func createConstraints() {
        
        mainCardTitleLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview().inset(16)
            $0.trailing.equalTo(cardImage.snp.leading)
            $0.height.lessThanOrEqualTo(40)
        }
        
        subCardTitleLabel.snp.makeConstraints {
            $0.top.equalTo(mainCardTitleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(mainCardTitleLabel)
            $0.trailing.equalTo(cardImage.snp.leading)
            $0.height.lessThanOrEqualTo(32)
        }
        
        cardImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(5)
            $0.size.equalTo(100)
        }
        
    }
    
}

