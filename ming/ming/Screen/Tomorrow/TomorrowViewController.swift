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
    
    var sampleData : [TomorrowDataModel] = []
    
    private let headerView = TomorrowHeaderView().then {
        $0.configure(text: "내일이 만들 기적")
    }
    
    private let footerView = TomorrowFooterView()
    @IBOutlet weak var miracleTextField: UITextField!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var miracleTableView: UITableView!
    
    @IBAction func doneBtnTap(_ sender: Any) {
        guard let text = miracleTextField.text else { return }
        sampleData.append(TomorrowDataModel(miracleText: text))
        miracleTextField.text?.removeAll()
        miracleTableView.reloadData()
    }
    
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
        let tommorowNib = UINib(nibName: TomorrowTableViewCell.identifier, bundle: nil)
        let emptyNib = UINib(nibName: EmptyTableViewCell.identifier, bundle: nil)
        miracleTableView.register(tommorowNib, forCellReuseIdentifier: TomorrowTableViewCell.identifier)
        miracleTableView.register(emptyNib, forCellReuseIdentifier: TomorrowTableViewCell.identifier)
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
        return sampleData.isEmpty ? 200 : 54
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return sampleData.count == 0 ? nil : footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 70
    }
}

extension TomorrowViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let count = sampleData.count
        if count == 0 {
            guard let emptyCell = tableView.dequeueReusableCell(withIdentifier: EmptyTableViewCell.identifier, for: indexPath) as? EmptyTableViewCell else { return UITableViewCell() }
            return emptyCell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TomorrowTableViewCell.identifier, for: indexPath) as? TomorrowTableViewCell else { return UITableViewCell() }
            cell.setData(sampleData[indexPath.row])
            
            return cell
        }
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

final class TomorrowFooterView: UIView{
    private let button = UIButton().then {
        $0.setTitle("저장하기", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        $0.backgroundColor = Color.mingBlack
        $0.layer.cornerRadius = 10
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        addSubview(button)
        button.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.height.equalTo(45)
            $0.width.equalTo(162)
        }
    }
}
//
//final class TomorrowEmptyView: UIView{
//    private let image = UIImageView().then {
//        $0.image = UIImage(named: "img_ming_lie_small")
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        render()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func render() {
//        addSubview(image)
//        image.snp.makeConstraints{
//            $0.center.equalToSuperview()
//        }
//    }
//}
