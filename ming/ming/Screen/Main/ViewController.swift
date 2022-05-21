//
//  ViewController.swift
//  ming
//
//  Created by 김윤서 on 2022/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    let baseView = CheckView()
    
    override func loadView() {
        self.view = baseView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "오늘의 기적"
    }
}

