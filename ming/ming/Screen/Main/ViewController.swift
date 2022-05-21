//
//  ViewController.swift
//  ming
//
//  Created by 김윤서 on 2022/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    let checkView = CheckView()
    var dismissCnt = 0
    
    override func loadView() {
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
    }
    
    @objc func popUp(sender: UIButton) {
        guard let customPopUp = UIStoryboard(name: "PopUp", bundle: nil).instantiateViewController(withIdentifier: "PopUpViewController") as? PopUpViewController
        else { return }
        
        switch sender {
        case checkView.firstBubble:
            customPopUp.compareText = checkView.firstLabel.text ?? ""
        case checkView.secondBubble:
            customPopUp.compareText = checkView.secondLabel.text ?? ""
        case checkView.thirdBubble:
            customPopUp.compareText = checkView.thirdLabel.text ?? ""
        default:
            customPopUp.compareText = ""
        }
        
        customPopUp.modalTransitionStyle = .crossDissolve
        customPopUp.modalPresentationStyle = .overFullScreen
        
        self.present(customPopUp, animated: true)
    }
}

