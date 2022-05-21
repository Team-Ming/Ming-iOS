//
//  MentionView.swift
//  ming
//
//  Created by 김윤서 on 2022/05/22.
//

import UIKit

import SnapKit
import Then

final class MentionView: UIView {
    private let backgroundView = UIImageView().then {
        $0.image = Image.bottomBackground
    }
    
    private let speechBubbleView = UIImageView().then {
        $0.image = Image.speechBubble4
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "밍기적 밍기적..\n새로운 기적을 만들어봐 !"
        $0.numberOfLines = 2
        $0.textColor = Color.mingBlack
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textAlignment = .center
    }
    
    private let standImageView = UIImageView().then {
        $0.image = Image.mingStand
        $0.contentMode = .scaleAspectFit
    }

    private let button = UIButton().then {
        $0.backgroundColor = Color.mingBlack
        $0.titleLabel?.font = .boldSystemFont(ofSize: 20)
        $0.setTitle("기적 만들기", for: .normal)
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
        
        addSubviews(backgroundView, speechBubbleView, standImageView)
        speechBubbleView.addSubview(titleLabel)
        addSubview(button)
        
        button.snp.makeConstraints {
            $0.width.equalTo(162)
            $0.height.equalTo(52)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-121)
        }
        
        speechBubbleView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(54)
            $0.top.equalTo(safeAreaLayoutGuide).inset(80)
        }
        
        backgroundView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(-30)
            $0.leading.trailing.equalToSuperview().inset(-50)
        }
        
        titleLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview().offset(-15)
            $0.centerX.equalToSuperview()
        }
        
        standImageView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(110)
            $0.bottom.equalTo(button.snp.top).offset(-20)
        }
    }
    
}
