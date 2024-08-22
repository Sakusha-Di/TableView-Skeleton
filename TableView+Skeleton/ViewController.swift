//
//  ViewController.swift
//  TableView+Skeleton
//

import UIKit
import SkeletonView
import TinyConstraints

class ViewController: UIViewController {
    
    private var tableView: UITableView!
    
    private var diffableDataSource: UITableViewDiffableDataSource<Int, String>!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureDataSource()
        applySnapshot()
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.applyNewSnapshot()
//        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.tableView.hideSkeleton()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.isSkeletonable = true
        tableView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .emerald))
    }

    private func configureTableView() {
        tableView = UITableView(frame: .zero, style: .plain)
        self.view.addSubview(tableView)
        tableView.edgesToSuperview(usingSafeArea: true)
//        tableView.delegate = self
        tableView.dataSource = diffableDataSource
//        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        
        tableView.estimatedRowHeight = 140
        view.addSubview(tableView)
    }

    private func configureDataSource() {
        diffableDataSource = UITableViewDiffableDataSource<Int, String>(tableView: tableView) { (tableView, indexPath, labelData) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
            cell.label1.text = labelData
            cell.label2.text = labelData
            cell.label3.text = labelData
            cell.label4.text = labelData
            // Configure other labels with respective data...
            return cell
        }
    }

    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
        snapshot.appendSections([0])
        snapshot.appendItems(["Cell Data 1",
                              "Cell Data 2",
                              "Cell Data 3",
                              "Cell Data 4"], toSection: 0)
        diffableDataSource.apply(snapshot)
    }
    
    private func applyNewSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
        snapshot.appendSections([0])
        snapshot.appendItems(["New Cell Data 1",
                              "New Cell Data 2",
                              "New Cell Data 3",
                              "New Cell Data 4"], toSection: 0)
        // Append other items and sections...
        diffableDataSource.apply(snapshot, animatingDifferences: false)
    }

}

extension UITableViewDiffableDataSource: SkeletonTableViewDataSource {
    public func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
       return "CustomCell"
    }
}

