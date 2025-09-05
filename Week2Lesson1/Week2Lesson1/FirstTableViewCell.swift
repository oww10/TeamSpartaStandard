
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

 Cell에 버튼 추가
 타이틀 : 데이터 추가
 배경색 : red
 가로 100, 세로 50
 label, contentView와 16 간격
 델리게이트를 사용해서 해당 셀 레이블의 텍스트 데이터를 추가해보기

 didSelectRowAt 구현해보기
 "셀 선택" 이라는 데이터 추가해보기
 */

protocol TableViewDelegateTest: AnyObject{
    func isButtonTapped(in cell: FirstTableViewCell)
}

class FirstTableViewCell: UITableViewCell{
    
    weak var delegate: (TableViewDelegateTest)?
    
    static let indentifier = "FirstTableViewCell"
    
    let dataLabel = UILabel()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("데이터 추가", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupUI()
        addButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        contentView.addSubview(dataLabel)
        contentView.addSubview(addButton)
        dataLabel.snp.makeConstraints{
            make in
            make.top.leading.bottom.equalToSuperview().inset(32)
        }
        //label, contentView와 16 간격
        addButton.snp.makeConstraints{
            make in
            make.leading.equalTo(dataLabel.snp.trailing).offset(16)
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.centerY.equalToSuperview()
        }
    }
    
    @objc func buttonTapped(){
        delegate?.isButtonTapped(in: self)
    }
    
    func configure(with data: String){
        self.dataLabel.text = data
    }
}
