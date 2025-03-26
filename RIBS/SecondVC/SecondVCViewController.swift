//
//  SecondVCViewController.swift
//  RIBS
//
//  Created by ADMIN on 3/25/25.
//


import RIBs
import RxSwift
import UIKit

protocol SecondVCPresentableListener: AnyObject {
    func toggleDescription(at indexpath: IndexPath)
}

final class SecondVCViewController: UIViewController, SecondVCPresentable, SecondVCViewControllable {
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var listener: SecondVCPresentableListener?
    private var faqCategories: [FAQCategory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    private func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        
        tableView.register(UINib(nibName: "FAQTBVC",
                                 bundle: nil), forCellReuseIdentifier: "FAQTBVC")
        tableView.register(UINib(nibName: "FAQHeaderTBVCTableViewCell",
                                 bundle: nil), forCellReuseIdentifier: "FAQHeaderTBVCTableViewCell")
    }
    
    func updateDataFaq(_ faqCategories: [FAQCategory]) {
        self.faqCategories = faqCategories
        self.tableView.reloadData()
    }
}

extension SecondVCViewController: UITableViewDelegate {
    
}

extension SecondVCViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faqCategories[section].contents?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FAQHeaderTBVCTableViewCell") as! FAQHeaderTBVCTableViewCell
        let item = faqCategories[section]
        let title = item.category ?? ""
        
        cell.configure(with: title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FAQTBVC", for: indexPath) as! FAQTBVC
        let item = faqCategories[indexPath.section].contents?[indexPath.row]
        cell.configure(with: item, indexpath: indexPath)
        
        cell.toggleDescription = { [weak self] in
            self?.listener?.toggleDescription(at: indexPath)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return faqCategories.count
    }
}
