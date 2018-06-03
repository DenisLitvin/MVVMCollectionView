//
//  Protocols.swift
//  MVVMCollectionView
//
//  Created by Denis Litvin on 02.06.2018.
//  Copyright © 2018 Denis Litvin. All rights reserved.
//

import UIKit

protocol ReusableView where Self: UIView {
    static var reuseIdentifier: String { get }
}

extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_ cell: T.Type)  {
        
        register(cell, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }
}

extension UICollectionViewCell: ReusableView {}

protocol MVVMCollectionViewDataSource: UICollectionViewDataSource {
    var cellViewModels: [[Any]] { get }
}

extension MVVMCollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return cellViewModels.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels[section].count
    }
}

protocol Test {
    associatedtype TestAsocType
}

