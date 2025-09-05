
import Foundation

import UIKit
import SnapKit
/*
 FirstViewController
 프로퍼티
 tableView (UITableView)
 datas ([Strings])
 코드베이스, SnapKit 사용
 
 
 델리게이트를 사용해서 해당 셀 레이블의 텍스트 데이터를 추가해보기
 
 didSelectRowAt 구현해보기
 "셀 선택" 이라는 데이터 추가해보기
 */



class FirstViewController: UIViewController{
    
    var datas = ["a","b","c"]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        tableView.backgroundColor = .gray
        configUI()
    }
    
    func configUI(){
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: FirstTableViewCell.indentifier)
        
        tableView.snp.makeConstraints{
            make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
    }
    
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource,TableViewDelegateTest{
    func isButtonTapped(in cell: FirstTableViewCell) {
        print("123")
        guard let text = cell.dataLabel.text else {return}
        datas.append(text)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        datas.append("셀 선택")
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.indentifier, for: indexPath) as? FirstTableViewCell else{
            return UITableViewCell()
        }
        
        let data = datas[indexPath.row]
        cell.configure(with: data)
        cell.delegate = self
        return cell
    }
}

#Preview{
    FirstViewController()
    
}
