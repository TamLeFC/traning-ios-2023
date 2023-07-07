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
            let cell = collectionView.dequeueReuseable(ofType: CategoryCell.self, indexPath: indexPath)
            cell.configureCell(item)
            return cell
        })
}

func getCommandsDataSource(onFavoriteChanged: @escaping (Command) -> Void) -> RxTableViewSectionedReloadDataSource<SectionModel<Void, Command>> {
    return RxTableViewSectionedReloadDataSource<SectionModel<Void, Command>>(
        configureCell: {
            (dataSource, tableView, indexPath, item) -> UITableViewCell in
            let cell = tableView.dequeueReuseable(ofType: CommandCell.self, indexPath: indexPath)
            cell.configureCell(item)
            cell.onFavoriteChanged = onFavoriteChanged
            return cell
        }
    )
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

