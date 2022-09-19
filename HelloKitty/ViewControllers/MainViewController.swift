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
    
    private  lazy var cardsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCardsCollectionViewFlowLayout())
    
    private var getYourOwnKittyLabel = UILabel()
    private var getYourOwnKittyButton = UIButton()
    
    private lazy var blueKittyCollectionView = UICollectionView(frame: .zero, collectionViewLayout: makeBlueKittyCollectionViewFlowLayout())
    
    private var collectionsLabel = UILabel()
    private var collectionsButton = UIButton()
    
    private lazy var pinkKittyCollectionView = UICollectionView(frame: .zero, collectionViewLayout: makePinkKittyCollectionViewFlowLayout())
    private var startYourDigitalCatCollectinImageView = UIImageView()
    private var startYourDigitalCatCollectinLabel = UILabel()
    
    private var cryptoCurrencyLabel = UILabel()
    private var cryptoCurrencyButton = UIButton()
    
    private lazy var usdView = UIView()
    private lazy var usdLabel = UILabel()
    
    private lazy var eurView = UIView()
    private lazy var eurLabel = UILabel()
    
    private lazy var cryptoView = UIView()
    
    private lazy var bitcoinIconView = UIView()
    private lazy var bitcoinIconLabel = UILabel()
    private lazy var bitcoinNameLabel = UILabel()
    private lazy var bitcoinValueLabel = UILabel()
    private lazy var bitcoinArrowDownImage = UIImageView()
    
    private lazy var ethereumIconView = UIView()
    private lazy var ethereumIconLabel = UILabel()
    private lazy var ethereumNameLabel = UILabel()
    private lazy var ethereumValueLabel = UILabel()
    private lazy var ethereumArrowUpImage = UIImageView()
    
    private lazy var xrpIconView = UIView()
    private lazy var xrpIconLabel = UILabel()
    private lazy var xrpNameLabel = UILabel()
    private lazy var xrpValueLabel = UILabel()
    private lazy var xrpArrowUpImage = UIImageView()




    
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
        scrollContentView.addSubview(cryptoCurrencyButton)
        
        scrollContentView.addSubview(usdView)
        usdView.addSubview(usdLabel)
        
        scrollContentView.addSubview(eurView)
        eurView.addSubview(eurLabel)
        
        scrollContentView.addSubview(cryptoView)
        cryptoView.addSubview(bitcoinIconView)
        bitcoinIconView.addSubview(bitcoinIconLabel)
        cryptoView.addSubview(bitcoinNameLabel)
        cryptoView.addSubview(bitcoinValueLabel)
        cryptoView.addSubview(bitcoinArrowDownImage)
        
        cryptoView.addSubview(ethereumIconView)
        ethereumIconView.addSubview(ethereumIconLabel)
        cryptoView.addSubview(ethereumNameLabel)
        cryptoView.addSubview(ethereumValueLabel)
        cryptoView.addSubview(ethereumArrowUpImage)
        
        cryptoView.addSubview(xrpIconView)
        xrpIconView.addSubview(xrpIconLabel)
        cryptoView.addSubview(xrpNameLabel)
        cryptoView.addSubview(xrpValueLabel)
        cryptoView.addSubview(ethereumArrowUpImage)
        cryptoView.addSubview(xrpArrowUpImage)


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
        
        cryptoCurrencyLabel.text = "Cryptocurrency rates"
        cryptoCurrencyLabel.font = .systemFont(ofSize: 16, weight: .bold)
        cryptoCurrencyButton.setImage(UIImage(named: "backButton"), for: .normal)
        cryptoCurrencyButton.contentMode = .scaleAspectFill

        usdView.backgroundColor = .lightGray
        usdView.layer.cornerRadius = 10
        usdLabel.text = "USD"
        usdLabel.font = .systemFont(ofSize: 12, weight: .regular)
        
        eurView.backgroundColor = UIColor(red: 0.804, green: 0.181, blue: 0.541, alpha: 1)
        eurView.layer.cornerRadius = 10
        eurLabel.text = "EUR"
        eurLabel.font = .systemFont(ofSize: 12, weight: .regular)
        eurLabel.textColor = .white
        
        cryptoView.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
        cryptoView.layer.cornerRadius = 8
        
        bitcoinIconView.backgroundColor = .blue
        bitcoinIconView.layer.cornerRadius = 10
        
        bitcoinIconLabel.text = "₿"
        bitcoinIconLabel.font = .systemFont(ofSize: 13, weight: .regular)
        bitcoinIconLabel.textColor = .white
        
        bitcoinNameLabel.text = "Bitcoin"
        bitcoinNameLabel.font = .systemFont(ofSize: 15, weight: .regular)
        bitcoinValueLabel.text = "57,039.1"
        bitcoinValueLabel.font = .systemFont(ofSize: 15, weight: .regular)
        
        bitcoinArrowDownImage.image = UIImage(named: "arrowDown")
        
        ethereumIconView.backgroundColor = .blue
        ethereumIconView.layer.cornerRadius = 10
        
        ethereumIconLabel.text = "E"
        ethereumIconLabel.font = .systemFont(ofSize: 13, weight: .regular)
        ethereumIconLabel.textColor = .white
        
        ethereumNameLabel.text = "Ethereum"
        ethereumNameLabel.font = .systemFont(ofSize: 15, weight: .regular)
        ethereumValueLabel.text = "1,782.23"
        ethereumValueLabel.font = .systemFont(ofSize: 15, weight: .regular)
        ethereumArrowUpImage.image = UIImage(named: "arrowUp")

        xrpIconView.backgroundColor = .blue
        xrpIconView.layer.cornerRadius = 10
        
        xrpIconLabel.text = "X"
        xrpIconLabel.font = .systemFont(ofSize: 13, weight: .regular)
        xrpIconLabel.textColor = .white
        
        xrpNameLabel.text = "XRP"
        xrpNameLabel.font = .systemFont(ofSize: 15, weight: .regular)
        xrpValueLabel.text = "0.574"
        xrpValueLabel.font = .systemFont(ofSize: 15, weight: .regular)
        xrpArrowUpImage.image = UIImage(named: "arrowUp")

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
        
        cryptoCurrencyLabel.snp.makeConstraints {
            $0.top.equalTo(startYourDigitalCatCollectinImageView.snp.bottom).offset(32)
            $0.leading.equalToSuperview().offset(16)
        }
        
        cryptoCurrencyButton.snp.makeConstraints {
            $0.top.equalTo(startYourDigitalCatCollectinImageView.snp.bottom).offset(32)
            $0.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(16)
        }
        
        usdView.snp.makeConstraints {
            $0.top.equalTo(cryptoCurrencyLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(42)
            $0.height.equalTo(22)
        }
        usdLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(4)
            $0.leading.bottom.equalToSuperview().offset(8)
        }
        
        eurView.snp.makeConstraints {
            $0.top.equalTo(cryptoCurrencyLabel.snp.bottom).offset(16)
            $0.leading.equalTo(usdView.snp.trailing).offset(8)
            $0.width.equalTo(42)
            $0.height.equalTo(22)
        }
        
        eurLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(4)
            $0.leading.bottom.equalToSuperview().offset(8)
        }
        
        cryptoView.snp.makeConstraints {
            $0.top.equalTo(eurLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(343)
            $0.height.equalTo(124)
        }
        
        bitcoinIconView.snp.makeConstraints {
            $0.leading.top.equalToSuperview().offset(16)
            $0.size.equalTo(20)
        }
        
        bitcoinIconLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().offset(6)
            $0.top.bottom.equalToSuperview().inset(2)
        }
        
        bitcoinNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalTo(bitcoinIconView.snp.trailing).offset(8)
            $0.width.equalTo(48)
            $0.height.equalTo(20)
        }
        
        bitcoinValueLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(30)
        }
        
        bitcoinArrowDownImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(21)
            $0.leading.equalTo(bitcoinValueLabel.snp.trailing).offset(5)
            $0.width.equalTo(8.74)
            $0.height.equalTo(10)
            
        }
        
        ethereumIconView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(bitcoinIconView.snp.bottom).offset(16)
            $0.size.equalTo(20)
        }
        
        ethereumIconLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().offset(6)
            $0.top.bottom.equalToSuperview().inset(2)
        }

        ethereumNameLabel.snp.makeConstraints {
            $0.top.equalTo(bitcoinNameLabel.snp.bottom).offset(16)
            $0.leading.equalTo(ethereumIconView.snp.trailing).offset(8)
            $0.width.equalTo(66)
            $0.height.equalTo(20)
        }

        ethereumValueLabel.snp.makeConstraints {
            $0.top.equalTo(bitcoinValueLabel.snp.bottom).offset(16)
            $0.trailing.equalToSuperview().inset(30)
        }

        ethereumArrowUpImage.snp.makeConstraints {
            $0.top.equalTo(bitcoinArrowDownImage.snp.bottom).offset(23)
            $0.leading.equalTo(ethereumValueLabel.snp.trailing).offset(5)
            $0.width.equalTo(8.74)
            $0.height.equalTo(10)
        }
        
        
        
        xrpIconView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(ethereumIconView.snp.bottom).offset(16)
            $0.size.equalTo(20)
        }
        
        xrpIconLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().offset(6)
            $0.top.bottom.equalToSuperview().inset(2)
        }

        xrpNameLabel.snp.makeConstraints {
            $0.top.equalTo(ethereumNameLabel.snp.bottom).offset(16)
            $0.leading.equalTo(xrpIconView.snp.trailing).offset(8)
            $0.width.equalTo(30)
            $0.height.equalTo(20)
        }

        xrpValueLabel.snp.makeConstraints {
            $0.top.equalTo(ethereumValueLabel.snp.bottom).offset(16)
            $0.trailing.equalToSuperview().inset(30)
        }

        xrpArrowUpImage.snp.makeConstraints {
            $0.top.equalTo(ethereumArrowUpImage.snp.bottom).offset(24)
            $0.leading.equalTo(xrpValueLabel.snp.trailing).offset(5)
            $0.width.equalTo(8.74)
            $0.height.equalTo(10)
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

