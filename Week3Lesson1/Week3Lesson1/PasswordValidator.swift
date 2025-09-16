/*
 에러 케이스
 에러타입명 : PasswordError
 emptyInput: 패스워드를 입력해주세요.
 tooLongInput: 패스워드는 8자 이하 입니다.
 wrongInput: 패스워드가 틀렸습니다.
 
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
import Foundation

public enum PasswordError: String, Error{
    case emptyInput = "패스워드를 입력해주세요."
    case tooLongInput = "패스워드는 8자 이하 입니다."
    case wrongInput = "패스워드가 틀렸습니다."
}
class PasswordValidator{
    
    private func passwordCheck(with input: String) throws -> Bool{
        if input == correctPassword.password.rawValue{
            return true
        } else{
            throw PasswordError.wrongInput
        }
    }
    
    func validate(with input: String) throws -> Bool{
        if input == ""{
            throw PasswordError.emptyInput
        } else if input.count > 8 {
            throw PasswordError.tooLongInput
        }
        return try passwordCheck(with: input)
        
    }
    
}
