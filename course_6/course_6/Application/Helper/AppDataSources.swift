//
//  AppDataSources.swift
//  course_6
//
//  Created by Mobile Dev on 13/07/2023.
//

import RxDataSources

func getKnotsDatasources() -> RxTableViewSectionedReloadDataSource<SectionModel<Void, Knot>> {
    return RxTableViewSectionedReloadDataSource<SectionModel<Void, Knot>>(
        configureCell: {
            (dataSource, tableView, indexPath, item) -> UITableViewCell in
            let cell = tableView.dequeueReuseable(ofType: CardCell.self, indexPath: indexPath)
            cell.configure(item)
            return cell
    })
}

func getMediasKnotDetailDatasources() -> RxCollectionViewSectionedReloadDataSource<SectionModel<Void, String>> {
    return RxCollectionViewSectionedReloadDataSource(configureCell: {
        (dataSource, collectionView, indexPath, item) -> UICollectionViewCell in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
        cell.configure(item)
        return cell
    })
}
