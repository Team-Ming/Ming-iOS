//
//  ViewController.swift
//  ming
//
//  Created by 김윤서 on 2022/05/21.
//

import UIKit

import Then

class ViewController: UIViewController {
    
    let checkView = CheckView()
    let successView = SuccessView()
    let mentionView = MentionView()
    var dismissCnt = 0
    
    var tag = 0
    
    @IBAction func showHistoryViewController(_ sender: Any) {
        
        self.navigationController?.pushViewController(HistoryViewController(), animated: true)
    }
    
    override func loadView() {
        if Repository.shared.checks.isEmpty {
            self.view = mentionView
            return
        }
        self.view = checkView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "오늘의 기적"
        setAction()
    }
    
    
    func setAction() {
        checkView.firstBubble.addTarget(self, action: #selector(popUp), for: .touchUpInside)
        checkView.secondBubble.addTarget(self, action: #selector(popUp), for: .touchUpInside)
        checkView.thirdBubble.addTarget(self, action: #selector(popUp), for: .touchUpInside)
        mentionView.button.addTarget(self, action: #selector(showTomorrowViewController), for: .touchUpInside)
        successView.button.addTarget(self, action: #selector(showMentionViewController), for: .touchUpInside)
    }
    
    @objc func popUp(sender: UIButton) {
        guard let customPopUp = UIStoryboard(name: "PopUp", bundle: nil).instantiateViewController(withIdentifier: "PopUpViewController") as? PopUpViewController
        else { return }
        customPopUp.delegate = self

        switch sender {
        case checkView.firstBubble:
            tag = 0
            customPopUp.compareText = checkView.firstLabel.text ?? ""
        case checkView.secondBubble:
            tag = 1
            customPopUp.compareText = checkView.secondLabel.text ?? ""
        case checkView.thirdBubble:
            tag = 2
            customPopUp.compareText = checkView.thirdLabel.text ?? ""
        default:
            customPopUp.compareText = ""
        }
        
        customPopUp.modalTransitionStyle = .crossDissolve
        customPopUp.modalPresentationStyle = .overFullScreen
        
        self.present(customPopUp, animated: true)
    }
    
    @objc
    func showTomorrowViewController() {
        guard let tomorrowViewController = UIStoryboard(name: "Tomorrow", bundle: nil).instantiateViewController(withIdentifier: "TomorrowViewController") as? TomorrowViewController
        else { return }
        
        let nav = BaseNavigationController(rootViewController: tomorrowViewController)
        nav.modalPresentationStyle = .overFullScreen
        tomorrowViewController.delegate = self
        self.present(nav, animated: true)
    }
    
    @objc
    func showMentionViewController() {
        Repository.shared.checks = []
        self.view = mentionView
    }
}

extension ViewController: ReloadDelegate {
    func reload(_ viewController: UIViewController) {
        switch viewController {
        case is TomorrowViewController:
            if Repository.shared.checks.isEmpty {
                self.view = mentionView
                return
            }
            self.view = checkView
            let checks = Repository.shared.checks
            if checks.count == 3 {
                checkView.configure(first: checks[0], second: checks[1], third: checks[2])
                return
            }
            
            if checks.count == 2 {
                checkView.configure(first: checks[0], second: checks[1], third: nil)
                return
            }
            
            if checks.count == 1 {
                checkView.configure(first: checks[0], second: nil, third: nil)
                return
            }
            
            if checks.isEmpty {
                self.view = successView
                return
            }

        case is PopUpViewController:
            switch tag {
            case 0:
                checkView.firstBubble.isHidden = true
            case 1:
                checkView.secondBubble.isHidden = true
               
            case 2:
                UIView.animate(withDuration: 0.05) {
                    self.checkView.thirdBubble.isHidden = true
                }
                self.view = successView
                successView.configure(checks: Repository.shared.checks)
            default:
                break
            }
        
        default:
            print("dd")
        }
    }

}
