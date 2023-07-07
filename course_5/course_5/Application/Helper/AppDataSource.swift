//
//  AppDataSource.swift
//  course_5
//
//  Created by Mobile Dev on 28/06/2023.
//

import RxDataSources

func getCategoriesDataSource() -> RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Category>> {
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


func getSetupDataSource() -> RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Setup>> {
    return RxCollectionViewSectionedReloadDataSource(configureCell: {
        (dataSource, collectionView, indexPath, item) -> UICollectionViewCell in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupCell.identifier, for: indexPath) as! GroupCell
        cell.configure(item)
        return cell
    })
}
