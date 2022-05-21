//
//  Reusable.swift
//  ming
//
//  Created by 김윤서 on 2022/05/21.
//

import Foundation

protocol Reusable: AnyObject {
  static var reuseIdentifier: String { get }
}

extension Reusable {
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}
