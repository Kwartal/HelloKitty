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
    private lazy var mainView = UIView()
    private lazy var mainTitleImage = UIImageView()
    private lazy var powerKittensView = UIView()
    private lazy var powerKittensLabel = UILabel()
    private lazy var powerKittensCounterLabel = UILabel()
    private lazy var powerKittensImageView = UIImageView()
    
    private lazy var cardsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCardsCollectionViewFlowLayout())
    
    private lazy var getYourOwnKittyLabel = UILabel()
    private lazy var getYourOwnKittyButton = UIButton()
    
    private lazy var blueKittyCollectionView = UICollectionView(frame: .zero, collectionViewLayout: makeBlueKittyCollectionViewFlowLayout())
    
    private lazy var collectionsLabel = UILabel()
    private lazy var collectionsButton = UIButton()

    
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
       
        return Card.mockCardsData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == blueKittyCollectionView) {
            print("collectionview:", indexPath.row)
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BlueKittyCollectionViewCell.identifier, for: indexPath) as? BlueKittyCollectionViewCell else { return UICollectionViewCell(frame: .zero) }
            cell.configure(blueKitty: BlueKitty.mockBlueKitty[indexPath.row])
            cell.contentView.layer.cornerRadius = 8
            cell.backgroundColor = .white
            cell.layer.shadowColor = UIColor.gray.cgColor
            cell.layer.shadowOpacity = 0.3
            cell.layer.shadowOffset = CGSize.zero
            cell.layer.shadowRadius = 6
            return cell
        } 
        
        else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardsCollectionViewCell.identifier, for: indexPath) as? CardsCollectionViewCell else { return UICollectionViewCell(frame: .zero) }
            cell.configure(card: Card.mockCardsData[indexPath.row])
            cell.contentView.layer.cornerRadius = 8
            return cell
        }
    }
}


extension MainViewController {
    
    private func addSubviews() {
        view.addSubview(mainTitleLabel)
        view.addSubview(mainTitleImage)
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(mainView)
        mainView.addSubview(powerKittensView)
        powerKittensView.addSubview(powerKittensLabel)
        powerKittensView.addSubview(powerKittensCounterLabel)
        powerKittensView.addSubview(powerKittensImageView)
        
        
        mainView.addSubview(cardsCollectionView)
        mainView.addSubview(getYourOwnKittyLabel)
        mainView.addSubview(getYourOwnKittyButton)
        mainView.addSubview(blueKittyCollectionView)
        mainView.addSubview(collectionsLabel)
        mainView.addSubview(collectionsButton)
        
    }
    
    private func setupSubviews() {
        view.backgroundColor = .white
        
        mainTitleLabel.text = "Cryptokitties"
        mainTitleLabel.font = .systemFont(ofSize: 24, weight: .heavy)
        
        mainScrollView.backgroundColor = .white
        mainScrollView.contentSize = CGSize(width: 0, height: 921)
        
        mainTitleImage.image = UIImage(named: "Title Image Kitty")
        
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
        
        getYourOwnKittyLabel.text = "Ger Your Own Kitty"
        getYourOwnKittyLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        
        getYourOwnKittyButton.setImage(UIImage(named: "backButton"), for: .normal)
        getYourOwnKittyButton.contentMode = .scaleAspectFill
        
        collectionsLabel.text = "Collection"
        collectionsLabel.font = .systemFont(ofSize: 16, weight: .bold)
        
        collectionsButton.setImage(UIImage(named: "backButton"), for: .normal)
        collectionsButton.contentMode = .scaleAspectFill

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
        
        mainView.snp.makeConstraints {
            $0.size.equalToSuperview()
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
            $0.leading.trailing.equalTo(view)
            $0.top.equalTo(powerKittensView.snp.bottom).offset(16)
            $0.height.equalTo(112)
        }
        
        getYourOwnKittyLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(cardsCollectionView.snp.bottom).offset(40)
        }
        
        getYourOwnKittyButton.snp.makeConstraints {
            $0.trailing.equalTo(view).inset(16)
            $0.top.equalTo(cardsCollectionView.snp.bottom).offset(42)
            $0.size.equalTo(16)
        }
        
        blueKittyCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalTo(view)
            $0.top.equalTo(getYourOwnKittyLabel.snp.bottom).offset(16)
            $0.height.equalTo(112)
        }
        
        collectionsLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(blueKittyCollectionView.snp.bottom).offset(32)
        }
        
        collectionsButton.snp.makeConstraints {
            $0.trailing.equalTo(view).inset(16)
            $0.top.equalTo(blueKittyCollectionView.snp.bottom).offset(34)
            $0.size.equalTo(16)
        }
        
        
    }
    
    func makeCardsCollectionViewFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
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
        layout.itemSize = CGSize(
            width: 135,
            height: 88
        )
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return layout
    }
}

