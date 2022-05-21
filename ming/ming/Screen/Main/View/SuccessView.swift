//
//  SuccessView.swift
//  ming
//
//  Created by 김윤서 on 2022/05/22.
//

import UIKit

import SnapKit
import Then

final class SuccessView: UIView {
    private let backgroundView = UIImageView().then {
        $0.image = Image.bottomBackground
    }
    private let titleLabel = UILabel().then {
        $0.text = "오늘의 밍...기적이었다!"
        $0.textColor = Color.mingBlack
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textAlignment = .center
    }
    
    private let hStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 10
    }

    private let standImageView = UIImageView().then {
        $0.image = Image.mingStand
        $0.contentMode = .scaleAspectFit
    }
    
    let button = UIButton().then {
        $0.backgroundColor = Color.mingBlack
        $0.titleLabel?.font = .boldSystemFont(ofSize: 20)
        $0.setTitle("처음으로", for: .normal)
        $0.setTitleColor(Color.mingWhite, for: .normal)
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func render() {
        backgroundColor = Color.mingBlack
        
        addSubviews(backgroundView, titleLabel, hStackView, standImageView)
        
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.leading.trailing.equalTo(safeAreaLayoutGuide).inset(60)
        }
        
        hStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(125)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide).inset(22)
        }
        
        standImageView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(110)
            $0.bottom.equalToSuperview().inset(80)
        }
    }
    
    func configure(checks: [String]) {
        for check in checks {
            let boxView = BlackBoxLineView()
            boxView.text = check
            hStackView.addArrangedSubview(boxView)
        }
        
        addSubview(button)
        button.snp.makeConstraints {
            $0.width.equalTo(162)
            $0.height.equalTo(52)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(hStackView.snp.bottom).offset(32)
        }
    }
    
}

final class BlackBoxLineView: UIView {
    var text: String = "" {
        didSet {
            label.text = text
        }
    }
    
    private let backgroundImageView = UIImageView().then {
        $0.image = Image.mingBlackBoxLine
        $0.contentMode = .scaleAspectFit
    }
    
    private let label = UILabel().then {
        $0.textColor = Color.mingBlack
        $0.font = .systemFont(ofSize: 15)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        addSubviews(backgroundImageView)
        backgroundImageView.addSubview(label)
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        label.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(20)
        }
    }
}
