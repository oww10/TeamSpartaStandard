/*
 
 컬렉션뷰 셀
 이름 : MyCollectionViewCell
 cornerRadius : 12, backgroundColor : systemGray5
 프로퍼티
 numberLabel 라는 이름의 UILabel
 textAlignment : center
 오토레이아웃은 전체에 inset 16
 메서드
 configure 라는 이름으로 Int 값 받아서 numberLabel 의 텍스트 변경
 

 */

import Foundation
import UIKit
import SnapKit

class MyCollectionViewCell: UICollectionViewCell{
    static let identifier = "MyCollectionViewCell"
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
     override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews(){
        contentView.addSubview(numberLabel)
    }
    
    private func setupUI(){
        contentView.backgroundColor = .systemGray5
        contentView.layer.cornerRadius = 12
        
        numberLabel.snp.makeConstraints{ make in
            make.edges.equalToSuperview().inset(16)
        }
    }
    
    func configure(with item: Int){
        numberLabel.text = "\(item)"
    }
    
    
}
