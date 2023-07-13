import RxDataSources

func getKnotsDataSource() -> RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Knot>> {
    return RxCollectionViewSectionedReloadDataSource<SectionModel<Void, Knot>>(
        configureCell: {
            (dataSource, collectionView, indexPath, item) -> UICollectionViewCell in
            let cell = collectionView.dequeueReuseable(ofType: HomeCollectionViewCell.self, indexPath: indexPath)
            cell.configure(item)
            return cell
        })
}

func getNewMediaKnotDataSource() -> RxCollectionViewSectionedReloadDataSource<SectionModel<Void, String>> {
    return RxCollectionViewSectionedReloadDataSource<SectionModel<Void, String>>(
        configureCell: {
            (dataSource, collectionView, indexPath, item) -> UICollectionViewCell in
            let cell = collectionView.dequeueReuseable(ofType: KnotDetailCollectionViewCell.self, indexPath: indexPath)
            cell.configure(item)
            return cell
        })
}
