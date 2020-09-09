//
//  ViewController.swift
//  speedRuns
//
//  Created by Aaron Rosenfeld on 9/9/20.
//  Copyright © 2020 Aaron Rosenfeld. All rights reserved.
//

import UIKit
import SnapKit
import ReSwift

class SearchViewController: UIViewController, StoreSubscriber {
    typealias StoreSubscriberStateType = AppState
    
    var gameList: [GameListable]?
    
    //MARK: - UI
    
    private lazy var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.backgroundColor = .systemTeal
        sb.searchBarStyle = .minimal
        return sb
    }()
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        tv.register(GameListCell.self, forCellReuseIdentifier: "cell")
        return tv
    }()

    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        mainStore.subscribe(self)
        mainStore.dispatch(GetGamesListAction())
    }
    
    func newState(state: AppState) {
        gameList = state.gamesList
    }

    private func setUpView() {
        title = "Find A Game"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.barTintColor = .systemTeal
        navigationController?.navigationBar.isTranslucent = false
        
        view.addSubview(searchBar)
        view.addSubview(tableView)
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }

}

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GameListCell
        cell.textLabel?.text = gameList?[indexPath.row].name
        cell.detailTextLabel?.text = "Subtitle line"
        return cell
    }
    
}

extension SearchViewController: UITableViewDelegate {
    
}
