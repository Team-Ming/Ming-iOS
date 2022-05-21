# 밍기적
<img width="862" alt="스크린샷 2022-05-22 01 48 11" src="https://user-images.githubusercontent.com/72497599/169661384-18449cc4-7daf-422c-a1fd-612d82c6544c.png">


다음 날 기억하고 싶은 것(내일 챙겨야 하는 준비물, 아침에 보고 싶은 나를 위한 멘트 등)을, 까먹지 않고 좀 더 잘 기억할 수 있도록 돕는 서비스입니다. 사용자는 자기 전에 기억하고 싶은 것을 적고, 다음 날 일어나서 그 내용을 그대로 한 번씩 따라 적음으로써 내용을 떠올립니다. 사용자가 내용을 모두 따라 적으면 자고 있던 귀여운 `밍`을 일으켜 오늘의 작은 기적을 이룰 수 있게 됩니다.

### 구현 여부
| 이름 | 화면 | 구현 여부 | 서버 연결 |
|:----:|:-----:|:----:|:----:| 
| 윤서 | 성공뷰 아카이브뷰 + 뷰간 데이터 연결 | ✅ | ✅  | 
| 민재 | 확인뷰 팝업 | ✅ | | 
| 소진 | 입력뷰 | ✅ | |


### 프로젝트 구현 
| iPhone 13 mini | iPhone SE |
|:----:|:-----:|
|  |  | 

# 코드 컨벤션

### **Commit Type**

`feat:` 새로운 기능 추가 (new feature)

`fix:` 버그 수정 (bug fix)

`docs:` 문서 작성, 수정 (documentation)

`style:` 코드 포맷팅, 세미콜론 누락 등 코드 변경이 없는 경우

`refactor:` 코드 리팩토링 (refactoring)

`test:` 테스트 코드, 리팩토링 테스트 코드 추가

`chore:` 빌드 업무 수정, 패키지 매니저 수정 등 (production code 변경이 없는 경우)

`perf:` 성능 개선

### **Issue Title**

`이슈`

라벨 - 자기 이름 , UI, 서버

`feature/이슈번호` 브랜치 만들기

### **커밋 메세지 Description**

```
[Commit Type] : 상세내용 (#이슈번호)
```

예시: `feat: UI 구현 (#24)`

### **Pull Request**

`[#이슈번호] 커밋 내용 요약`

```
### Description
- 커밋 상세내용 1
- 커밋 상세내용 2

closed #이슈번호
```

### Git Branch
Branch를 생성하기 전 Issue를 먼저 작성한다. Issue 작성 후 생성되는 번호와 Issue의 간략한 설명 등을 조합하여 Branch의 이름을 결정한다.

<Prefix>/<Issue_Number>-<Description> 의 양식을 따른다.

develop : feature 브랜치에서 구현된 기능들이 merge될 브랜치. default
feature : 기능을 개발하는 브랜치, 이슈별/작업별로 브랜치를 생성하여 기능을 개발한다
main : 개발이 완료된 산출물이 저장될 공간

### Git Flow
Issue를 생성한다.
feature Branch를 생성한다.
Add - Commit - Push - Pull Request 의 과정을 거친다.
Pull Request가 작성되면 작성자 이외의 다른 팀원이 Code Review를 한다.
Code Review가 완료되면 Pull Request 작성자가 develop Branch로 merge 한다.
종료된 Issue와 Pull Request의 Label과 Project를 관리한다.

# 프로젝트 폴더링
<img width="389" alt="스크린샷 2022-05-22 01 54 31" src="https://user-images.githubusercontent.com/72497599/169661548-88c3c1f1-3375-4d0c-920f-94997324e4c7.png">

### 라이브러리
- Alamofire
- Snapkit
- Then
- Kingfisher
 
### 새벽의 우리.... ㅋㅋ
 <img width="566" alt="스크린샷 2022-05-22 08 05 05" src="https://user-images.githubusercontent.com/72497599/169671660-fac15482-54e3-4537-b9c5-cbe868dde557.png">

