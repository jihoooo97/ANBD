![Swift 5.10](https://img.shields.io/badge/Swift-5.10-F05138.svg?style=flat&color=F05138) 
![Xcode 15.3](https://img.shields.io/badge/Xcode-15.3-147EFB.svg?style=flat&color=147EFB)
![iOS 16.0+](https://img.shields.io/badge/iOS-16.0+-147EFB.svg?style=flat&color=00E007)
![Tuist 4.18](https://img.shields.io/badge/Tuist-4.18-147EFB.svg?style=flat&color=6E12CB)

# 🐳 ANBD
> 사용하지 않는 물건을 교환하거나 나눔하고, 절약 방법을 커뮤니티에 공유하여 환경 보호에 기여할 수 있는 플랫폼  
[앱스토어](https://apps.apple.com/kr/app/anbd/id6502585089)
<br>

## Screen 📱
<details>
<summary>더 보기</summary>
 
### 홈 · 검색
> 아껴쓰기, 나눠쓰기, 바꿔쓰기, 다시쓰기 항목들을 한 눈에 확인할 수 있습니다.

| <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/d274e3d2-a067-4c1d-9117-13d95ba01248" width="180"> | <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/67104e96-7ee8-4ccb-b947-6cc6a471e7cd" width="180"> | <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/7b84675d-e4ff-4f8d-83f8-525dbd3bbb6d" width="180"> | <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/8f26cbf7-4abd-4a91-9f68-a0b9b3a4c51e" width="180"> |
|--|--|--|--|


### 정보 공유
> **아나바다** 중 아껴쓰기 / 다시쓰기에 해당하는 탭으로 사용자가 알고 있는 물건을 아껴 쓰거나 다시 쓸 수 있는 꿀팁·노하우를 게시할 수 있습니다.

| <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/1ae13738-74b9-49f9-afc1-21a3389c3506" width="180"> | <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/2e9f4333-a65f-4dca-a8ac-9bb133d1b3ea" width="180"> | <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/25182bb6-5a08-4dcd-a8da-0f40faf298ae" width="180"> | <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/a7416f44-e72c-4a51-9420-a57799fba6f0" width="180"> |
|--|--|--|--|

### 나눔 · 거래
> **아나바다** 중 나눠쓰기 / 바꿔쓰기에 해당하는 탭으로 사용자들이 원하는 물건을 무료나눔 혹은 물물교환할 수 있습니다.

| <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/ff773521-f5d9-44bf-a38f-b46264243df1" width="180"> | <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/2e678454-8ee3-4d23-849f-a7c11527a33b" width="180"> | <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/ad052478-c0a7-4b59-967f-b9b2cbb827c0" width="180"> | <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/8c514cd4-c002-4d36-baa8-ed22f4ced94e" width="180"> |
|--|--|--|--|

### 채팅
> 다른 사용자와 **나눔·거래**를 진행할 때 약속을 잡거나 추가적인 정보들을 주고 받을 수 있도록 1:1 채팅을 지원합니다.

| <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/5b70c116-e63e-47c5-a218-adffac5b3cc5" width="180"> | <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/ded19b18-a9dd-4116-bdc6-61196a9b9bf5" width="180"> | <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/be61b153-f47b-4b6f-a9e5-6d45663749fd" width="180"> |
|--|--|--|

### 내 정보
> 내가 등록한 정보를 확인하고 수정할 수 있습니다.

| <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/622719a2-fbf4-4e81-b724-3b5c4e0b8acb" width="180"> | <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/61e1764e-cc6d-45a4-9b6e-c6628115b036" width="180"> |
|--|--|

</details>
<br>


## 개발 환경
| 버전 | iOS 16.0+ |
|:-:|:-:|
| Framework | SwiftUI |
| 구조 | MVVM + Clean + Architecture Combine |
| DI | Swinject |
| BaaS | FirebaseFirestore |
| Library | Firebase, Kingfisher |
<br>

## 프로젝트 빌드

1. mise를 통해 Tuist를 설치한 상태여야합니다. [Tuist 설치 방법](https://docs.tuist.io/guide/introduction/installation.html)
2. git clone
3. 프로젝트 경로에서 tuist install
4. tuist generate
<br>

## 모듈 구조

![graph](https://github.com/jihoooo97/ANBD/blob/main/graph.png)

> **모듈화**
```
- 비슷한 책임을 갖는 코드(클래스, 패키지, 라이브러리 등)를 묶어 모듈로 나눠서 응집도를 향상시킴
- 모듈 간 의존 관계를 설정함으로써 알아야하는 대상과 알지 못해야하는 대상을 명확히 구분해줌으로 결합도를 낮추고 실수를 방지해 유지 보수가 용이함
- 만들어 놓은 모듈은 다른 프로젝트에서도 재사용할 수 있어 개발 효율이 높아짐
```

- **ANBD**  
App 모듈 (App, DI, Coordinator)
- **Presentation**  
UI관련 모듈 (View, ViewModel)
- **Data**  
서버, 로컬 데이터와 직접적으로 통신하는 모듈
- **Domain**  
비즈니스 로직 모듈
- **ANBDCore**  
공통 기능(Enum, Extension, Manager), 외부 라이브러리 의존성
- **CommonUI**  
앱 전반으로 쓰일 공통 UI 모듈 (ViewModifier, Custom View, UI-Extension, Font · Color Enum)

<br>

### License 🐟 
Copyright iOS 앱 스쿨 4기 TeamGG. All rights reserved.     
Licensed under the [MIT](LICENSE) license.    

<br>
