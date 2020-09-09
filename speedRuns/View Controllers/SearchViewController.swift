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
import Nuke

class SearchViewController: UIViewController, StoreSubscriber {
    typealias StoreSubscriberStateType = AppState
    
    var gameList: [GameListable]?
    
    //MARK: - UI
    
    private lazy var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.backgroundColor = .systemTeal
        sb.searchBarStyle = .minimal
        sb.delegate = self
        return sb
    }()
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        tv.separatorStyle = .none
        tv.register(GameListCell.self, forCellReuseIdentifier: "cell")
        return tv
    }()

    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        mainStore.subscribe(self)
    }
    
    func newState(state: AppState) {
        gameList = state.gamesList
        DispatchQueue.main.async { [unowned self] in
            self.tableView.reloadData()
        }
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
        cell.gameName = gameList?[indexPath.row].name
        cell.releaseDate = gameList?[indexPath.row].releaseDate
        let imageURL = URL(string: gameList?[indexPath.row].imageURL ?? "")!
        let options = ImageLoadingOptions(
            placeholder: UIImage(named: "placeholder"),
            transition: .fadeIn(duration: 0.33),
            contentModes: .init(success: .scaleAspectFit, failure: .scaleAspectFit, placeholder: .scaleAspectFit)
        )
        Nuke.loadImage(with: imageURL, options: options, into: cell.gameImageView)
        return cell
    }
    
}

extension SearchViewController: UITableViewDelegate {
    
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        mainStore.dispatch(getGameListThunk(searchBar.text ?? ""))
        tableView.setContentOffset(.zero, animated: false)
    }
    
}
