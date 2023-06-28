import RxDataSources

func getCagegoriesDataSource() -> RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Category>> {
    return RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Category>>(
        configureCell: {
            (dataSource, collectionView, indexPath, item) -> UICollectionViewCell in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
            cell.configure(item)
            return cell
        })
}

func getSetupsDataSource() -> RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Setup>> {
    return RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Setup>>(
        configureCell: {
            (dataSource, collectionView, indexPath, item) -> UICollectionViewCell in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SetupCollectionViewCell", for: indexPath) as! SetupCollectionViewCell
            cell.configure(item)
            return cell
        })
}

func getCommandsDataSource() -> RxTableViewSectionedReloadDataSource<SectionModel<Void, Command>> {
    return RxTableViewSectionedReloadDataSource<SectionModel<Void, Command>>(
        configureCell: {
            (dataSource, tableView, indexPath, item) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommandTableViewCell", for: indexPath) as! CommandTableViewCell
            cell.configure(item)
            return cell
        })
}
