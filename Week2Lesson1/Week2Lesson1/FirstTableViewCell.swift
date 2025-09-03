
import UIKit
import SnapKit

/*
 FirstTableViewCell
 프로퍼티
 dataLabel (UILabel)
 메서드
 이름은 configure, 파라미터로 data라는 이름의 String 타입을 받고
 dataLabel의 text를 data로 변경하는 기능
 코드베이스, SnapKit 사용
 */

class FirstTableViewCell: UITableViewCell{
    
    static let indentifier = "FirstTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with data: String){
        self.textLabel?.text = "\(data)"
    }
}
