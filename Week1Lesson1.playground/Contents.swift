//Person 이라는 이름의 클래스 만들기
//
//프로퍼티: name (String), age (Int)
//이니셜라이저: name, age를 초기화
//메서드: talk라는 이름으로 안녕하세요, name, age를 print하는 기능

class Person{
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func talk(){
        print("안녕하세요. 저의 이름은 \(name)입니다. 저의 나이는 \(age) 입니다.")
    }
}

let person1 = Person(name: "oww", age: 10)

person1.talk()

let person2 = Person(name: "woola", age: 15)

person2.talk()
