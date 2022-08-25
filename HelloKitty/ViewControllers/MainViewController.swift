//
//  ViewController.swift
//  HelloKitty
//
//  Created by Богдан Баринов on 22.08.2022.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    
    
    //MARK: - UI Elements
    private lazy var mainTitleLabel = UILabel()
    private lazy var mainScrollView = UIScrollView()
    private lazy var mainTitleImage = UIImageView()
    private lazy var powerKittensView = UIView()
    private lazy var powerKittensLabel = UILabel()
    private lazy var powerKittensCounterLabel = UILabel()
    private lazy var powerKittensImageView = UIImageView()
    
    private lazy var cardsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: cardsCollectionViewFlowLayout)
    private lazy var cardsCollectionViewFlowLayout = makeCardsCollectionViewFlowLayout()
    
    private lazy var getYourOwnKitty = UILabel()
    private lazy var rightArrowButton = UIButton()
    
    private lazy var blueKittyCollectionView = UICollectionView(frame: .zero, collectionViewLayout: blueKittyCollectionFlowLayout)
    private lazy var blueKittyCollectionFlowLayout = makeBlueKittyCollectionViewFlowLayout()
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupSubviews()
        configureConstraints()
        configureCollectionView()
    }
}
extension MainViewController {
    func configureCollectionView() {
        cardsCollectionView.register(CardsCollectionViewCell.self, forCellWithReuseIdentifier: CardsCollectionViewCell.identifier)
        cardsCollectionView.delegate = self
        cardsCollectionView.dataSource = self
        
        blueKittyCollectionView.register(BlueKittyCollectionViewCell.self, forCellWithReuseIdentifier: BlueKittyCollectionViewCell.identifier)
        blueKittyCollectionView.delegate = self
        blueKittyCollectionView.dataSource = self
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == blueKittyCollectionView) {
            return BlueKitty.mockBlueKitty.count
        }
        
        return Card.mockCardsData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardsCollectionViewCell.identifier, for: indexPath) as? CardsCollectionViewCell else { return UICollectionViewCell(frame: .zero) }
        cell.configure(card: Card.mockCardsData[indexPath.row])
        cell.contentView.layer.cornerRadius = 8
//        if (collectionView == blueKittyCollectionView) {
//            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: BlueKittyCollectionViewCell.identifier, for: indexPath) as? BlueKittyCollectionViewCell else { return UICollectionViewCell(frame: .zero) }
//            cell2.configure(card: BlueKitty.mockBlueKitty[indexPath.row])
//            cell2?.contentView.layer.cornerRadius = 8
//            return cell2!
//        }
        return cell
    }
    
}

extension MainViewController {
    
    private func addSubviews() {
        view.addSubview(mainTitleLabel)
        view.addSubview(mainScrollView)
        view.addSubview(mainTitleImage)
        mainScrollView.addSubview(powerKittensView)
        powerKittensView.addSubview(powerKittensLabel)
        powerKittensView.addSubview(powerKittensCounterLabel)
        powerKittensView.addSubview(powerKittensImageView)
        
        view.addSubview(cardsCollectionView)
        view.addSubview(getYourOwnKitty)
        view.addSubview(rightArrowButton)
        
    }
    
    private func setupSubviews() {
        view.backgroundColor = .white
        
        mainTitleLabel.text = "Cryptokitties"
        mainTitleLabel.font = .systemFont(ofSize: 24, weight: .heavy)
        
        mainScrollView.backgroundColor = .white
        
        mainTitleImage.image = UIImage(named: "TitleImageKitty")
        
        powerKittensView.backgroundColor = .white
        powerKittensView.layer.shadowColor = UIColor.gray.cgColor
        powerKittensView.layer.shadowOpacity = 0.3
        powerKittensView.layer.shadowOffset = CGSize.zero
        powerKittensView.layer.shadowRadius = 6
        
        powerKittensLabel.text = "The power of my kittens"
        powerKittensLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        
        powerKittensCounterLabel.text = "812/1000"
        powerKittensCounterLabel.font = .systemFont(ofSize: 12, weight: .regular)
        
        powerKittensImageView.image = UIImage(named: "Cell Content Right")
        
        getYourOwnKitty.text = "Ger Your Own Kitty"
        getYourOwnKitty.font = .systemFont(ofSize: 16, weight: .semibold)
        
        rightArrowButton.setImage(UIImage(systemName: "backButton"), for: .normal)
    }
    
    
    
    
    private func configureConstraints() {
        mainTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(60)
        }
        
        mainScrollView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(mainTitleLabel.snp.bottom).offset(24)
        }
        
        mainTitleImage.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(mainTitleLabel)
        }
        
        powerKittensView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.width.greaterThanOrEqualTo(343)
            $0.leading.trailing.equalTo(view).inset(16)
            $0.height.equalTo(64)
        }
        
        powerKittensLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.leading.equalToSuperview().offset(16)
        }
        
        powerKittensCounterLabel.snp.makeConstraints {
            $0.top.equalTo(powerKittensLabel.snp.bottom).offset(4)
            $0.leading.equalTo(powerKittensLabel)
        }
        
        powerKittensImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(8)
        }
        
        cardsCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(powerKittensView.snp.bottom).offset(16)
            $0.height.equalTo(112)
        }
        
        getYourOwnKitty.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(cardsCollectionView.snp.bottom).offset(40)
        }
        
        rightArrowButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(16)
            $0.top.equalTo(cardsCollectionView.snp.bottom).offset(40)
        }
    }
    
    func makeCardsCollectionViewFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //        layout.minimumInteritemSpacing = 0
        //        layout.minimumLineSpacing = 12
        layout.itemSize = CGSize(
            width: 252,
            height: 112
        )
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return layout
    }
    
    func makeBlueKittyCollectionViewFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //        layout.minimumInteritemSpacing = 0
        //        layout.minimumLineSpacing = 12
        layout.itemSize = CGSize(
            width: 135,
            height: 88
        )
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return layout
    }
    
}



