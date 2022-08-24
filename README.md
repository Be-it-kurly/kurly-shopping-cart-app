## **🌄 스크린샷 (GIF 파일)**

## ⚙️ Client Front-End (Flutter) Architecture

✅  ***GetX*** 프레임워크를 적극 사용하였습니다.

✻ 전체적인 흐름은 아래와 같습니다.

1. ***View***는 유저의 액션 (touch, scroll 등)을 받고 ***Controller***에 넘겨줍니다.
2. ***Controller***는 받은 액션을 토대로 ***Repository***에 적절한 파라미터를 넘겨줘서 특정 비즈니스 로직을 수행하도록 합니다
3. Repository는 HTTP Request 방식을 알맞게 구성하여 ***DIO***에 값을 요청합니다.
4. DIO는 최종적으로 백엔드와 통신하여 값을 얻어냅니다.
5. HTTP Response를 최종적으로 받으면 왔던 방향 반대로 순서대로 돌아가 success 또는 error를 리턴하여 UI에 반영합니다.

## 👨🏻‍💻 Team

- Flutter 개발자 1명
- 백엔드 개발자 1명

## ✋🏻 맡은 부분

- **프론트 앱 전체 개발**
    - Flutter 기반 Android/iOS에 동시 대응할 수 있는 앱 개발 담당
- **디자인**
    - 직접 Figma를 이용한 디자인/프로토타이핑을 담당. 해당 디자인을 기반으로 앱 개발 진행
- **아이디어 기획**
- **발표 PPT 제작**
