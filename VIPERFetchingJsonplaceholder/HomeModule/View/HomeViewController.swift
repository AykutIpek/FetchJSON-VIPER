//
//  ViewController.swift
//  VIPERFetchingJsonplaceholder
//
//  Created by aykut ipek on 7.03.2023.
//
import UIKit

final class HomeViewController: UIViewController {
    // MARK: - UIElements
    public var homePresenterObject: ViewToPresenterHomeProtocol?
    public var postList: [PostEntity] = []
    // MARK: - Properties
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.frame,style: .insetGrouped)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homePresenterObject?.viewPosts()
    }
}

// MARK: - Helpers
extension HomeViewController{
    private func setupUI(){
        style()
        layout()
    }
    private func style(){
        HomeRouter.execModule(ref: self) 
        
        //TableView Style
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
    }
    private func layout(){
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension HomeViewController: PresenterToViewHomeProtocol{
    func sendDataToView(postList: [PostEntity]) {
        DispatchQueue.main.async {
            self.postList = postList
            self.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = self.postList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PostTableViewCell
        cell.textLabel?.text = post.title
        return cell
    }
    
    
}
