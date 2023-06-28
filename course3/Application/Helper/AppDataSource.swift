//
//  AppDataSource.swift
//  course3
//
//  Created by Tam Le on 28/06/2023.
//

import RxDataSources

func getCagegoriesDataSource() -> RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Category>> {
    return RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Category>>(
        configureCell: {
            (dataSource, collectionView, indexPath, item) -> UICollectionViewCell in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.configure(item)
            return cell
    })
}
