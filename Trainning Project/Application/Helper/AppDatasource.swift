//
//  AppDatasource.swift
//  Trainning Project
//
//  Created by KietKoy on 17/07/2023.
//

import Foundation
import RxDataSources

func getAddonsDataSource() -> RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Addon>> {
    return RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Addon>>(
        configureCell: {
            (dataSource, collectionView, indexPath, item) -> UICollectionViewCell in
            let cell = collectionView.dequeueReuseable(ofType: AddonCell.self, indexPath: indexPath)
            cell.configureCell(item)
            return cell
        })
}
