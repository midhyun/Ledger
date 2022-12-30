### 라이브러리

- dj_rest_auth
  - https://dj-rest-auth.readthedocs.io/en/latest/
    - 회원가입, 로그인/로그아웃, 비밀번호 변경등 drf api를 빠르게 구현가능함.
- simplejwt
  - https://django-rest-framework-simplejwt.readthedocs.io/en/latest/
    - DRF JWT 를 구현하기 위한 라이브러리
- 

### API

##### Accounts

- `/dj_rest_auth/login/` **LOGIN**
  - method: POST
  - data: `email`, `password`
- `/dj_rest_auth/logout/` **LOGOUT**
  - method: POST
  - data:
- `/registration/` **SIGNUP**
  - method: POST
  - data: `email`, `password1`,`password2`

##### Ledgers

- `/ledgers/` **INDEX**
  - method: GET
  - data: 
- `/ledgers/create` **CREATE**
  - method: POST
  - data:`user`, `categories`, `title`, `content`, `paid_money`, `paid_at`
- `/ledgers/<ledgers_pk>/delete` **DELETE**
  - method: GET
  - data: `ledgers_pk`
- `/ledgers/<ledgers_pk>/detail` **DETAIL**
  - method: GET
  - data: `ledgers_pk`
- `/ledgers/<ledgers_pk>/replica` **REPLICATION**
  - method: GET
  - data: `ledgers_pk`

**Shortener**

- `/shortener/` **SHORTURL**
  - method: POST
  - data: `link`
- `/<short_url>/` **SHORTURL_REDIRECT**
  - method: get
  - data: `short_url`



- 주어진 일정 안에서, 명시된 기능들을 완성하기 위해 simplejwt와 dj_rest_auth 라이브러리를 채택하였습니다.
- dj_rest_auth 와 simplejwt를 사용하기 위해 django rest framework 를 활용하여야 했고,  drf의 클래스형 뷰를 처음 다루어 보면서, 오버라이딩/커스텀을 하는데에 추가적인 학습의 필요성으로 인해 가계부 api의 경우 함수형 뷰로 작성하게 되었습니다. 



- 단축 URL을 구현하며 만료기한 설정에 두가지 아이디어가 있었습니다.
  - 서버에서 만료기한이 지난 row를 DB에서 삭제하는 것. ( 서버에서 주기적으로 감지하는 부하가 발생 )
  - 단축 URL을 통한 접속시에 만료기한과 현재시간을 비교하는 것.
    - URL을 생성 할 때, 기존의 DB에 이미 단축된 URL이 있고, 만료기한이 지났을 경우에 기한을 현재 시간을 기준으로 재설정,
  - 후자의 경우 DB에 걸리는 부하가 상대적으로 적다고 판단하였습니다.



- 날짜형식의 비교에서 naive 타입과 aware 타입의 UTC여부에 대해서도 알아볼 수 있었습니다.

```
a = datetime.now()
b = ledger.expire

b - a

TypeError: can't subtract offset-naive and offset-aware datetimes
```

- 추후 더 효율적인 만료기간 관리방법에 학습하고, 구현의 필요성을 느꼈습니다.