//
//  AppDataSource.swift
//  Course5
//
//  Created by KietKoy on 28/06/2023.
//

import RxDataSources
func getCagegoriesDataSource() -> RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Category>> {
    return RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Category>>(
        configureCell: {
            (dataSource, collectionView, indexPath, item) -> UICollectionViewCell in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.configureCell(item)
            return cell
    })
}
func getSetupsDataSource() -> RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Setup>> {
    return RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Setup>>(
        configureCell: {
            (dataSource, collectionView, indexPath, item) -> UICollectionViewCell in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SetupCell", for: indexPath) as! SetupCell
            cell.configureCell(item)
            return cell
    })
}

