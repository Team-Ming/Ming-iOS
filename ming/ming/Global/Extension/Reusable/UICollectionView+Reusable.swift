//
//  UICollectionView+Reusable.swift
//  ming
//
//  Created by 김윤서 on 2022/05/21.
//

import UIKit.UICollectionView

extension UICollectionReusableView: Reusable { }

extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier,
                                             for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }

    func dequeueHeaderView<T: UICollectionReusableView>(forIndexPath indexPath: IndexPath) -> T {
        guard let view = dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: T.reuseIdentifier,
            for: indexPath
        ) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return view
    }

    func dequeueFooterView<T: UICollectionReusableView>(forIndexPath indexPath: IndexPath) -> T {
        guard let view = dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: T.reuseIdentifier,
            for: indexPath
        ) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return view
    }

    func register<T>(
        cell: T.Type,
        forCellWithReuseIdentifier reuseIdentifier: String = T.reuseIdentifier
    ) where T: UICollectionViewCell {
        register(cell, forCellWithReuseIdentifier: reuseIdentifier)
    }
}
