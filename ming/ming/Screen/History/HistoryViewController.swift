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
