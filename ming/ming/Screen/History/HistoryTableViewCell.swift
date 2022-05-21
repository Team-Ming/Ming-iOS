//
//  HistoryTableViewCell.swift
//  ming
//
//  Created by 김윤서 on 2022/05/22.
//

import UIKit

final class HistoryTableViewCell: UITableViewCell {
    private let backgroundImageView = UIImageView().then {
        $0.image = Image.mingBlackBoxBig
        $0.contentMode = .scaleAspectFit
    }
    private let titleLabel = UILabel().then {
        $0.textColor = Color.mingBlack
        $0.font = .boldSystemFont(ofSize: 17)
    }
    
    private let hStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 10
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        
        for view in self.hStackView.subviews {
            view.removeFromSuperview()
        }
    }
    
    private func render() {
        contentView.addSubviews(backgroundImageView)
        backgroundImageView.addSubview(hStackView)
        
        backgroundImageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        hStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(25)
        }
    }
    
    func configure(history: History) {
        titleLabel.text = history.title
        hStackView.addArrangedSubview(titleLabel)
        
        for check in history.checks {
            let label = UILabel()
            label.textColor = Color.mingBlack
            label.font = .systemFont(ofSize: 15)
            label.text = check
            hStackView.addArrangedSubview(label)
        }
        
    }
    
}
