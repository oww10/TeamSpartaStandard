/*
 뷰컨트롤러
 이름 : MyCollectionViewController
 프로퍼티
 items 라는 이름의 1~20 Int 배열
 collectionView 라는 이름의 컬렉션뷰
 오토레이아웃은 뷰 전체에 inset 8
 
 레이아웃
 프로퍼티 : 이니셜라이저에서 설정 가능하게 구현
 columns: CGFloat
 sectionInsetValue: CGFloat
 itemSpacing: CGFloat
 rowSpacing: CGFloat
 itemHeight: CGFloat
 itemSize 라는 이름의 셀 아이템 사이즈 계산 메서드 구현
 
 
 먼저 3열 구현하기
 N개의 Column에 대해서 대응 가능하도록 작성
 */

import Foundation
import UIKit
import SnapKit

class MyCollectionViewController: UIViewController{
    let items = Array(1...20)
    
    let colums: CGFloat
    let sectionInsetValue: CGFloat
    let itemSpacing: CGFloat
    let rowSpacing: CGFloat
    let itemHeight: CGFloat
    
    
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collectionView
    }()
    
    init(colums: CGFloat = 3,
         sectionInsetValue: CGFloat = 16,
         itemSpacing: CGFloat = 16,
         rowSpacing: CGFloat = 16,
         itemHeight: CGFloat = 80
    ){
        self.colums = colums
        self.sectionInsetValue = sectionInsetValue
        self.itemSpacing = itemSpacing
        self.rowSpacing = rowSpacing
        self.itemHeight = itemHeight
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///화면 leading,trailing inset이랑 item 간격
    /// total = (itemSpacing * (colums -1)) + (sectionInsetValue * 2)
    /// 가로길이  view의bound.width  - total - inset(8)  * 2
    /// item의 길이 = widthSize / colums
    func itemSize() -> CGSize{
        let totalSpacing = (itemSpacing * (colums - 1)) + (sectionInsetValue * 2)
        let widthSize = view.bounds.width - totalSpacing - 16
        let itemWidthSize = widthSize / colums
        
        return CGSize(width: itemWidthSize, height: itemHeight)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        counfiguerViews()
        setUI()
        
        
    }
    private func counfiguerViews(){
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        
    }
    private func setUI(){
        collectionView.snp.makeConstraints{make in
            make.edges.equalToSuperview().inset(8)
        }
    }
    
}
#Preview{
    MyCollectionViewController()
}
