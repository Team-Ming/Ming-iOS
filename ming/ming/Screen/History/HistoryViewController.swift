//
//  HistoryViewController.swift
//  ming
//
//  Created by 김윤서 on 2022/05/22.
//

import UIKit

import SnapKit
import Then

final class HistoryViewController: UIViewController {
    private let dummyData = [
        History(title: "5월 22일의 기적", checks: ["양치하기", "밥먹기", "잠 푹자기"]),
        History(title: "5월 21일의 기적", checks: ["양치하기", "밥먹기", "잠 푹자기"]),
        History(title: "5월 20일의 기적", checks: ["양치하기", "밥먹기", "잠 푹자기"]),
        History(title: "5월 19일의 기적", checks: ["양치하기", "밥먹기", "잠 푹자기"]),
        History(title: "5월 18일의 기적", checks: ["양치하기", "밥먹기", "잠 푹자기"]),
        History(title: "5월 17일의 기적", checks: ["양치하기", "밥먹기", "잠 푹자기"]),
        History(title: "5월 16일의 기적", checks: ["양치하기", "밥먹기", "잠 푹자기"]),
        History(title: "5월 15일의 기적", checks: ["양치하기", "밥먹기", "잠 푹자기"]),
    ]
    private lazy var tableView = UITableView().then {
        $0.delegate = self
        $0.dataSource = self
        $0.rowHeight = UITableView.automaticDimension
        $0.separatorStyle = .none
        $0.registerReusableCell(HistoryTableViewCell.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        render()
    }
    
    private func configure() {
        title = "내가 만든 기적"
        view.backgroundColor = Color.mingWhite
    }
    
    private func render() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }
}

extension HistoryViewController: UITableViewDelegate {
    
}

extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HistoryTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.configure(history: dummyData[indexPath.row])
        return cell
    }
}

struct History {
    let title: String
    let checks: [String]
}

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
