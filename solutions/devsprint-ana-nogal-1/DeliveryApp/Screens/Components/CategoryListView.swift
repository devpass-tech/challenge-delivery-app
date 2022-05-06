//
//  CollectionView.swift
//  DeliveryApp
//
//  Created by Anderson Oliveira on 04/05/22.
//

import Foundation



import UIKit

final class CategoryListView: UIView, ViewConfiguration {
    
    private var categories: [Category]
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 64, height: 80)
        layout.sectionInset = UIEdgeInsets(top: 21.5, left: 18, bottom: 21.5, right: 18)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    
    init(categories: [Category]) {
        self.categories = categories
        super.init(frame: .zero)
        collectionView.delegate = self
        collectionView.dataSource = self
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configViews() {
        backgroundColor = .white
    }
    
    func buildViews() {
        [collectionView].forEach(addSubview)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
extension CategoryListView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let category = categories[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
        
        cell.updateCell(imageName: category.categoryImageLabel, category: category.categoryName)
        return cell
    }
}

extension CategoryListView:  UICollectionViewDelegate {
    
}
