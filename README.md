# 밍기적
<img width="862" alt="스크린샷 2022-05-22 01 48 11" src="https://user-images.githubusercontent.com/72497599/169661384-18449cc4-7daf-422c-a1fd-612d82c6544c.png">

다음 날 기억하고 싶은 것(내일 챙겨야 하는 준비물, 아침에 보고 싶은 나를 위한 멘트 등)을, 까먹지 않고 좀 더 잘 기억할 수 있도록 돕는 서비스입니다. 사용자는 자기 전에 기억하고 싶은 것을 적고, 다음 날 일어나서 그 내용을 그대로 한 번씩 따라 적음으로써 내용을 떠올립니다. 사용자가 내용을 모두 따라 적으면 자고 있던 귀여운 `밍`을 일으켜 오늘의 작은 기적을 이룰 수 있게 됩니다.

# 역할분배
### 역할분배
| 이름 | 담당 |
| --- | --- |
| 윤서 | 성공뷰 아카이브뷰 |
| 민재 | 확인뷰 말풍선클릭뷰 |
| 소진 | 입력뷰 |

지수: 전체적으로 감독

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
<img width="862" alt="스크린샷 2022-05-22 01 47 58" src="https://user-images.githubusercontent.com/72497599/169661368-3a5f49a5-97c2-4468-9022-20c294e3a73d.png">

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

# Git Branch
develop - feature

# 프로젝트 폴더링

![스크린샷 2022-05-22 01.40.07.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4cbec594-10e2-463f-8908-9709cbeef297/스크린샷_2022-05-22_01.40.07.png)

### 라이브러리
- Alamofire
- Snapkit
- Then
- Kingfisher
