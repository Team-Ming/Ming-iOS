//
//  TomorrowViewController.swift
//  ming
//
//  Created by Sojin Lee on 2022/05/22.
//

import UIKit

import SnapKit
import Then

class TomorrowViewController: UIViewController {
    
    private let headerView = TomorrowHeaderView().then {
        $0.configure(text: "내일이 만들 기적")
    }

    @IBOutlet weak var miracleTextField: UITextField!
    @IBOutlet weak var doneBtn: UIButton!
    
    @IBOutlet weak var miracleTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        registerNib()
        registerDelegate()
    }
    
    private func configureUI(){
        self.navigationItem.title = "내일의 기적"
        doneBtn.backgroundColor = Color.mingWhite
        doneBtn.layer.cornerRadius = 10
    }
    
    private func registerNib(){
        let nib = UINib(nibName: TomorrowTableViewCell.identifier, bundle: nil)
        miracleTableView.register(nib, forCellReuseIdentifier: TomorrowTableViewCell.identifier)
    }
    
    private func registerDelegate(){
        miracleTableView.delegate = self
        miracleTableView.dataSource = self
    }
}

extension TomorrowViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
}

extension TomorrowViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TomorrowDataModel.sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TomorrowTableViewCell.identifier, for: indexPath) as? TomorrowTableViewCell else { return UITableViewCell() }
        cell.setData(TomorrowDataModel.sampleData[indexPath.row])
        
        return cell
    }
    
    
}

final class TomorrowHeaderView: UIView {
    private let label = UILabel().then {
        $0.text = "내일 만들 기적"
        $0.font = .boldSystemFont(ofSize: 17)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        addSubview(label)
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    func configure(text: String) {
        label.text = text
    }
}
