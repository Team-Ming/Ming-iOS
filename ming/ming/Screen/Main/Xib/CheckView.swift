//
//  CheckView.swift
//  ming
//
//  Created by 김민재 on 2022/05/22.
//

import UIKit

import SnapKit
import Then

class CheckView: UIView {
    
    let firstBubble: UIButton = UIButton().then { button in
        button.backgroundColor = .red
        button.setImage(UIImage(systemName: "house.fill"), for: .normal)
    }
    let secondBubble: UIButton = UIButton().then { button in
        button.backgroundColor = . red
        button.setImage(UIImage(systemName: "house.fill"), for: .normal)
    }
    let thirdBubble: UIButton = UIButton().then { button in
        button.backgroundColor = . red
        button.setImage(UIImage(systemName: "house.fill"), for: .normal)
    }
    
    let bubbleImage: UIImageView = UIImageView(image: UIImage(named: "bubble_stitch"))
    let mingImage: UIImageView = UIImageView(image: UIImage(named: "img_ming_lie"))
    
    let firstLabel = UILabel().then { label in
        label.text = "솝커톤"
        label.font =  .boldSystemFont(ofSize: 20)
    }
    
    let secondLabel = UILabel().then { label in
        label.text = "솝커톤"
        label.font =  .boldSystemFont(ofSize: 20)
    }
    
    let thirdLabel = UILabel().then { label in
        label.text = "솝커톤"
        label.font =  .boldSystemFont(ofSize: 20)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setLayout() {
        self.backgroundColor = .white
        self.addSubviews(firstBubble)
        
        self.firstBubble.snp.makeConstraints {
            $0.top.equalToSuperview().offset(103)
            $0.leading.equalToSuperview().offset(44)
        }
        
        firstBubble.addSubviews(firstLabel)
        self.firstLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(30)
        }
        

        self.addSubviews(secondBubble)
        self.secondBubble.snp.makeConstraints {
            $0.top.equalTo(firstBubble.snp.top).inset(137)
            $0.leading.equalToSuperview().offset(183)
            $0.trailing.equalToSuperview().offset(37)
        }
        
        
        self.addSubviews(thirdBubble)
        self.thirdBubble.snp.makeConstraints {
            $0.top.equalTo(secondBubble.snp.bottom)
            $0.leading.equalToSuperview().offset(57)
        }
        
        self.addSubviews(bubbleImage)
        self.bubbleImage.snp.makeConstraints {
            $0.top.equalTo(thirdBubble.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(61)
        }
        
        self.addSubviews(mingImage)
        self.mingImage.snp.makeConstraints {
            $0.top.equalTo(bubbleImage.snp.bottom)
            $0.leading.equalToSuperview().offset(108)
            $0.bottom.equalToSuperview().offset(-58)
        }
        
        
    }
}
