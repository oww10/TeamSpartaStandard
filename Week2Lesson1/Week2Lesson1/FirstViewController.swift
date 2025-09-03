
import Foundation

import UIKit
import SnapKit
/*
 FirstViewController
 프로퍼티
 tableView (UITableView)
 datas ([Strings])
 코드베이스, SnapKit 사용
 */

class FirstViewController: UIViewController{
    
    let datas = ["a","b","c","d","e"]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI(){
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: FirstTableViewCell.indentifier)
        
        tableView.snp.makeConstraints{
            make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
    }
    
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.indentifier, for: indexPath) as? FirstTableViewCell else{
            return UITableViewCell()
        }
        
        let data = datas[indexPath.row]
        cell.configure(with: data)
        return cell
    }
}

#Preview{
    FirstViewController()
    
}
