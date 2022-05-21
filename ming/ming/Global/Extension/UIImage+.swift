//
//  UIImage+.swift
//  ming
//
//  Created by 김윤서 on 2022/05/22.
//

import UIKit.UIImage

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
