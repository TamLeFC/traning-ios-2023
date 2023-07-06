import RxDataSources

func getCagegoriesDataSource() -> RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Category>> {
    return RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Category>>(
        configureCell: {
            (dataSource, collectionView, indexPath, item) -> UICollectionViewCell in
            let cell = collectionView.dequeueReuseable(ofType: HomeCollectionViewCell.self, indexPath: indexPath)
            cell.configure(item)
            return cell
        })
}

func getSetupsDataSource() -> RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Setup>> {
    return RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Setup>>(
        configureCell: {
            (dataSource, collectionView, indexPath, item) -> UICollectionViewCell in
            let cell = collectionView.dequeueReuseable(ofType: SetupCollectionViewCell.self, indexPath: indexPath)
            cell.configure(item)
            return cell
        })
}

func getCommandsDataSource(onFavoriteChanged: @escaping (Command) -> Void) -> RxTableViewSectionedReloadDataSource<SectionModel<Void, Command>> {
    return RxTableViewSectionedReloadDataSource<SectionModel<Void, Command>>(
        configureCell: {
            (dataSource, tableView, indexPath, item) -> UITableViewCell in
            let cell = tableView.dequeueReuseable(ofType: CommandTableViewCell.self, indexPath: indexPath)
            cell.configure(item)
            cell.onFavoriteChanged = onFavoriteChanged
            return cell
        })
}
