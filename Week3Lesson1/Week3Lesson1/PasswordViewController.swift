import UIKit
import SnapKit
/*
 PasswordValidator 만들기

 메서드
 private passwordCheck(with input: String) throws -> Bool
 passwordCheck 메서드는 private으로 만들기
 파라미터명 input, String
 Bool값 리턴
 실제 비밀번호(password)와 입력값을 비교한다.
 동일하면 true 반환
 다르면 PasswordError.wrongInput throw

 validate(with input: String) throws -> Bool
 파라미터명 input, String
 Bool값 리턴
 검증 규칙:
 빈 문자열이면 PasswordError.emptyInput throw
 8자 초과 입력이면 PasswordError.tooLongInput throw
 그 외에는 내부 passwordCheck(with:) 실행
 비밀번호가 올바르면 true
 틀리면 에러 throw
 
 버튼 동작

 PasswordValidator로 에러를 받으면
 UIAlertController를 사용해 에러 메세지를 띄우기
 받지 않는다면
 passwordLabel의 text를 성공으로 변경
 
 PasswordValidator의 passwordCheck 메서드는 private으로 만들기
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
        textField.autocapitalizationType = .none
        
        return textField
    }()
    
    let passwordButton: UIButton = {
        let button = UIButton()
        button.setTitle("입력", for: .normal)
        button.backgroundColor = .red
        return button
    }()

    @objc func buttontapped(){
        let checkPassword = PasswordValidator()
        let alert = UIAlertController(title: "패스워드 알람", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)

        guard let password = passwordTextField.text else {return}
        
        do{
            _ = try checkPassword.validate(with: password)
            passwordLabel.text = "성공"
        } catch let error as PasswordError {
            alert.message = error.rawValue
            present(alert,animated: true,completion: nil)
            
        } catch{
            alert.message = "오류 발생"
            present(alert,animated: true,completion: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
