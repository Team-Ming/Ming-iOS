//
//  PopUpViewController.swift
//  ming
//
//  Created by 김민재 on 2022/05/22.
//

import UIKit

class PopUpViewController: UIViewController {
    weak var delegate: ReloadDelegate?
    
    let vc = ViewController()
    
    var compareText: String?
    
    @IBOutlet weak var compareLabel: UILabel! 
  
    @IBOutlet weak var confirmBtn: UIButton! {
        didSet {
            confirmBtn.layer.cornerRadius = 20
            confirmBtn.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelText()
    }
    
    @IBAction func confirmBtnDidTapped(_ sender: UIButton) {
        if compareLabel.text == textField.text {
            vc.dismissCnt += 1
            
            delegate?.reload(self)
            self.dismiss(animated: true)
        }
    }
    
    func setLabelText() {
        if let text = compareText {
            compareLabel.text = text
        }
        
    }

}
