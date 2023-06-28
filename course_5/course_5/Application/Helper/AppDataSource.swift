//
//  AppDataSource.swift
//  course_5
//
//  Created by Mobile Dev on 28/06/2023.
//

import RxDataSources

func getCategoriesDataSource() -> RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Category>> {
    return RxCollectionViewSectionedReloadDataSource(configureCell: {
            (dataSource, collectionView, indexPath, item) ->
                UICollectionViewCell in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CommandCell", for: indexPath) as! CommandCell
        cell.configure(item)
        return cell
    })
}

func getSetupDataSource() -> RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Setup>> {
    return RxCollectionViewSectionedReloadDataSource(configureCell: {
        (dataSource, collectionView, indexPath, item) -> UICollectionViewCell in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupCell", for: indexPath) as! GroupCell
        cell.configure(item)
        return cell
    })
}
