//
//  UIView+.swift
//  ming
//
//  Created by 김윤서 on 2022/05/21.
//

import UIKit.UIView

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
