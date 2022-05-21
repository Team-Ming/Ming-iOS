//
//  UIStackView+.swift
//  ming
//
//  Created by 김윤서 on 2022/05/21.
//

import UIKit.UIStackView

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
