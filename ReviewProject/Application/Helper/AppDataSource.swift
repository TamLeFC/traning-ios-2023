import RxDataSources

func getAddonsDataSource() -> RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Addon>> {
    return RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Addon>>(
        configureCell: {
            (dataSource, collectionView, indexPath, item) -> UICollectionViewCell in
            let cell = collectionView.dequeueReuseable(ofType: ListAddonCollectionViewCell.self, indexPath: indexPath)
            cell.configure(item)
            return cell
        })
}
