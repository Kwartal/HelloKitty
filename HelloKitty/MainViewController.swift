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
    private lazy var cardsScrollView = UIScrollView()
    private lazy var cardsStackView = UIStackView()
    private lazy var testView1 = UIView()
    private lazy var testView2 = UIView()
    private lazy var collectionView = UICollectionView()
    

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupSubviews()
        configureConstraints()
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
        view.addSubview(cardsScrollView)
        
        cardsScrollView.addSubview(testView1)
        cardsScrollView.addSubview(testView2)
        
    }
    
    private func setupSubviews() {
        view.backgroundColor = .white
            
        mainTitleLabel.text = "Cryptokitties"
        mainTitleLabel.font = .systemFont(ofSize: 24, weight: .heavy)
        
        mainScrollView.backgroundColor = .white
        
        mainTitleImage.image = UIImage(named: "TitleImageKitty")
        
        powerKittensView.backgroundColor = .white
        
        let layer2 = CALayer()
        layer2.masksToBounds = false
        layer2.applySketchShadow(color: .black, alpha: 1, x: 0, y: 2, blur: 16, spread: 0)
//        powerKittensView.layer.insertSublayer(layer2, at: 1)
        powerKittensView.layer.addSublayer(layer2)
        
        powerKittensView.layer.applySketchShadow(color: .black, alpha: 0.08, x: 0, y: 1, blur: 8, spread: 0)
//        powerKittensView.layer.applySketchShadow(color: .black, alpha: 0.08, x: 0, y: 2, blur: 16, spread: 0)
        
        powerKittensLabel.text = "The power of my kittens"
        powerKittensLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        
        powerKittensCounterLabel.text = "812/1000"
        powerKittensCounterLabel.font = .systemFont(ofSize: 12, weight: .regular)
        
        powerKittensImageView.image = UIImage(named: "Cell Content Right")
        
        cardsScrollView.backgroundColor = .yellow
        cardsScrollView.alwaysBounceHorizontal = true
                
        testView1.backgroundColor = .black
        testView2.backgroundColor = .black
                
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
        
        cardsScrollView.snp.makeConstraints {
            $0.top.equalTo(powerKittensView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(112)
        }
        
        testView1.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.bottom.equalToSuperview().offset(20)
            $0.size.equalTo(10)
        }
        
        testView2.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(16)
            $0.top.bottom.equalToSuperview().inset(20)
            $0.size.equalTo(80)
        }
        
//        cardsStackView.snp.makeConstraints {
//            $0.leading.equalToSuperview()
//            $0.top.bottom.equalToSuperview()
//            $0.width.equalTo(800)
//        }

    }
}


