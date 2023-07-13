//
//  AppDatasource.swift
//  Course6
//
//  Created by KietKoy on 13/07/2023.
//

import Foundation
import RxDataSources

func getKnotsDataSource() -> RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Knot>> {
    return RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Knot>>(
        configureCell: {
            (dataSource, collectionView, indexPath, item) -> UICollectionViewCell in
            let cell = collectionView.dequeueReuseable(ofType: KnotCell.self, indexPath: indexPath)
            cell.configureCell(item)
            return cell
        })
}

func getMediaKnotDataSource() -> RxCollectionViewSectionedReloadDataSource<SectionModel<Void, String>> {
    return RxCollectionViewSectionedReloadDataSource<SectionModel<Void, String>>(
        configureCell: {
            (dataSource, collectionView, indexPath, item) -> UICollectionViewCell in
            let cell = collectionView.dequeueReuseable(ofType: MediaCell.self, indexPath: indexPath)
            cell.configureCell(item)
            return cell
        })
}

