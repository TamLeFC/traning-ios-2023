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
            let cell = collectionView.dequeueReuseable(ofType: CategoryCell.self, indexPath: indexPath)
            cell.configure(item)
            return cell
    })
}

func getCommandsDataSource(onFavoriteChanged: @escaping (Command) -> Void) -> RxTableViewSectionedReloadDataSource<SectionModel<Void, Command>> {
    return RxTableViewSectionedReloadDataSource<SectionModel<Void, Command>>(
        configureCell: {
            (dataSource, tableView, indexPath, item) -> UITableViewCell in
            let cell = tableView.dequeueReuseable(ofType: CommandCell.self, indexPath: indexPath)
            cell.configure(item)
            cell.onFavoriteChanged = onFavoriteChanged
            return cell
    })
}
