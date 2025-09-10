import UIKit
import SnapKit

/*
 UI/레이아웃 요구사항
 뷰컨트롤러명 : PasswordViewController
 
 passwordLabel
 화면 정가운데 정렬
 
 passwordTextField
 높이 50
 좌우 30 인셋
 passwordLabel 위에 위치하며 간격 10
 borderStyle은 roundedRect
 password라고 입력하고 passwordButton을 누르면 passwordLabel text를 "성공"으로 변경
 
 passwordButton
 passwordLabel 밑에 간격 10 위치, center Label과 맞춤
 Title: 입력
 Width : 100, height : 50
 backgroundColor : red
 */
enum correctPassword: String{
    case password = "password"
}

class PasswordViewController: UIViewController {
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        
        return label
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.text = ""
        textField.borderStyle = .roundedRect
        
        
        return textField
    }()
    
    let passwordButton: UIButton = {
        let button = UIButton()
        button.setTitle("입력", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    @objc func buttontapped(){
        if passwordTextField.text == correctPassword.password.rawValue{
            passwordLabel.text = "성공"
        } else{
            passwordLabel.text = "실패"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuerUI()
        setUpLayer()
        
        passwordButton.addTarget(self, action: #selector(buttontapped), for: .touchUpInside)
    }
    
    func configuerUI(){
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordButton)
        
    }
    func setUpLayer(){
        passwordLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(10)
            make.height.equalTo(50)
            make.leading.equalToSuperview().inset(30)
            make.trailing.equalToSuperview().inset(30)
        }
        
        passwordButton.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
    }
    
}

#Preview{
    PasswordViewController()
}
