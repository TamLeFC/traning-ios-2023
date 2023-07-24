//
//  AppDataSources.swift
//  TrainingProject
//
//  Created by Mobile Dev on 17/07/2023.
//

import RxDataSources

func getMineCraftsDatasources() -> RxTableViewSectionedReloadDataSource<SectionModel<Void, MineCraft>> {
    return RxTableViewSectionedReloadDataSource<SectionModel<Void, MineCraft>>(
        configureCell: {
            (dataSource, tableView, indexPath, item) -> UITableViewCell in
            let cell = tableView.dequeueReuseable(ofType: ItemCell.self, indexPath: indexPath)
            cell.configure(item)
            return cell
    })
}

func getFavoriteCraftsDatasources() -> RxTableViewSectionedReloadDataSource<SectionModel<Void, MineCraft>> {
    return RxTableViewSectionedReloadDataSource<SectionModel<Void, MineCraft>>(
        configureCell: {
            (dataSource, tableView, indexPath, item) -> UITableViewCell in
            let cell = tableView.dequeueReuseable(ofType: ItemCell.self, indexPath: indexPath)
            cell.configure(item)
            return cell
    })
}
