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
    private var dummyData: [History] = []
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
        
        MingService.shared.getMiracle { result in
            switch result {
            case .success(let response):
                dump(response)
                guard let response = response as? Response else {
                    break
                }
            
                for item in response.data {
                    self.dummyData.append(History(title: item.createdAt.date , checks: item.content))
                }
            default:
                break
            }
            
            self.tableView.reloadData()
        }
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

extension String {
    private static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.locale = Locale.autoupdatingCurrent
        formatter.timeZone = TimeZone.autoupdatingCurrent
        return formatter
    }()

    private static let dateOnly: DateFormatter = {
         let formatter = DateFormatter()
         formatter.dateFormat = "MM월 dd일 의 기적"
         return formatter
    }()

    var date: String {
        guard let date = String.iso8601Full.date(from: self) else { return "" }
        return String.dateOnly.string(from: date)
    }
}
