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
    private var mainTitleLabel = UILabel()
    private var scrollView = UIScrollView()
    private var scrollContentView = UIView()
    private var mainTitleImage = UIImageView()
    private var powerKittensView = UIView()
    private var powerKittensLabel = UILabel()
    private var powerKittensCounterLabel = UILabel()
    private var powerKittensImageView = UIImageView()
    
    private var cardsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCardsCollectionViewFlowLayout())
    
    private var getYourOwnKittyLabel = UILabel()
    private var getYourOwnKittyButton = UIButton()
    
    private var blueKittyCollectionView = UICollectionView(frame: .zero, collectionViewLayout: makeBlueKittyCollectionViewFlowLayout())
    
    private var collectionsLabel = UILabel()
    private var collectionsButton = UIButton()
    
    private var pinkKittyCollectionView = UICollectionView(frame: .zero, collectionViewLayout: makePinkKittyCollectionViewFlowLayout())
    private var startYourDigitalCatCollectinImageView = UIImageView()
    private var startYourDigitalCatCollectinLabel = UILabel()
    
    private var cryptoCurrencyLabel = UILabel()
    private var cryptoCurrencyButton = UIButton()
    
    
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
    
        pinkKittyCollectionView.register(PinkKittyCollectionViewCell.self, forCellWithReuseIdentifier: PinkKittyCollectionViewCell.identifier)
        pinkKittyCollectionView.delegate = self
        pinkKittyCollectionView.dataSource = self
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
        
        else if(collectionView == cardsCollectionView)
        {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardsCollectionViewCell.identifier, for: indexPath) as? CardsCollectionViewCell else { return UICollectionViewCell(frame: .zero) }
            cell.configure(card: Card.mockCardsData[indexPath.row])
            cell.contentView.layer.cornerRadius = 8
            return cell
        }
        else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PinkKittyCollectionViewCell.identifier, for: indexPath) as? PinkKittyCollectionViewCell else { return UICollectionViewCell(frame: .zero) }
            cell.configure(pinkKitty: PinkKitty.mockPinkKitty[indexPath.row])
            cell.contentView.layer.cornerRadius = 8
            cell.backgroundColor = .white
            cell.layer.shadowColor = UIColor.gray.cgColor
            cell.layer.shadowOpacity = 0.3
            cell.layer.shadowOffset = CGSize.zero
            cell.layer.shadowRadius = 6
            return cell
        }
    }
}


extension MainViewController {
    
    private func addSubviews() {
        view.addSubview(mainTitleLabel)
        view.addSubview(mainTitleImage)
        view.addSubview(scrollView)
        scrollView.addSubview(scrollContentView)
        scrollContentView.addSubview(powerKittensView)
        powerKittensView.addSubview(powerKittensLabel)
        powerKittensView.addSubview(powerKittensCounterLabel)
        powerKittensView.addSubview(powerKittensImageView)
         
        scrollContentView.addSubview(cardsCollectionView)
        scrollContentView.addSubview(getYourOwnKittyLabel)
        scrollContentView.addSubview(getYourOwnKittyButton)
        scrollContentView.addSubview(blueKittyCollectionView)
        scrollContentView.addSubview(collectionsLabel)
        scrollContentView.addSubview(collectionsButton)
        scrollContentView.addSubview(pinkKittyCollectionView)
        scrollContentView.addSubview(startYourDigitalCatCollectinImageView)
        startYourDigitalCatCollectinImageView.addSubview(startYourDigitalCatCollectinLabel)
        scrollContentView.addSubview(cryptoCurrencyLabel)
        scrollContentView.addSubview(cryptoCurrencyLabel)

    }
    
    private func setupSubviews() {
        view.backgroundColor = .white
        
        mainTitleLabel.text = "Cryptokitties"
        mainTitleLabel.font = .systemFont(ofSize: 24, weight: .heavy)
        
        scrollView.backgroundColor = .white
        scrollView.contentSize = CGSize(width: 0, height: 921)
        
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
        
        startYourDigitalCatCollectinImageView.image = UIImage(named: "startYourDigitalCatCollection")
        
        startYourDigitalCatCollectinLabel.numberOfLines = 0
        startYourDigitalCatCollectinLabel.text = "Start Your Digital Cat Collectin"
        startYourDigitalCatCollectinLabel.textColor = .white
        startYourDigitalCatCollectinLabel.font = .systemFont(ofSize: 16, weight: .bold)
        startYourDigitalCatCollectinLabel.adjustsFontSizeToFitWidth = true

    }
    
    
    
    
    private func configureConstraints() {
        mainTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(60)
        }
        
        scrollView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(mainTitleLabel.snp.bottom).offset(24)
        }
        
        scrollContentView.snp.makeConstraints {
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
        
        pinkKittyCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalTo(view)
            $0.top.equalTo(collectionsLabel.snp.bottom).offset(16)
            $0.height.equalTo(112)
        }
        
        startYourDigitalCatCollectinImageView.snp.makeConstraints {
            $0.top.equalTo(pinkKittyCollectionView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        startYourDigitalCatCollectinLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(210)
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
    
    func makePinkKittyCollectionViewFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(
            width: 135,
            height: 104
        )
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return layout
    }
}

