
# Assignment 2 : Set

## 목표

본 과제의 목표는 어플리케이션을 혼자서 처음부터 만들어보는것이다.

과제1의 코드에서 시작하지 말고 새 프로젝트를 생성해서 진행할것.

## 자료

링크를 [Set](https://en.wikipedia.org/wiki/Set_(card_game)) 참고해도 좋음

[유튜브 설명](https://www.youtube.com/watch?v=Kc4WrL7cxeg) 보는게 나은듯

## 요구 작업

1. 솔로 플레이어 게임을 구현할것

2. 최소한 24개의 Set 카드 공간을 가져야함. 모든 카드는 항상 윗면을 보여준다

3. 시작시 12장을 나눠준다. 그것들은 화면 어디에도 나타날 수 있다. (겹치지만 않으면 상관없음)

4. "3장 더 지급" 버튼이 필요할 것이다. (Set의 규칙에 따라서)

5. 유저가 카드를 터치해서 선택할 수 있도록한다. 선택된것을 어떻게 UI에 표시할지는 알아서한다. 아래에 힌트가 있음. 1, 2개 선택상태에서는 선택 취소도 가능해야한다.

6. 3개 카드가 선택되면, 셋인지 아닌지 알려준다. 컬러로 알려줘도 된다. 유저는 명백하게 매치 성공인지 실패인지를 알 수 있어야한다.

7. 카드가 선택되었을때 이미 3개의 non-matching 셋이 선택되었다면 선택 취소시키고 선택된 카드를 골라라.

8. Set 의 규칙에 따라서, 어떤 카드가 선택되고 이미 3 매칭 셋이 선택되어있다면, 매칭된 카드들을 덱에서 3개 대체해라. 만약 덱이 비어있다면 대체할 수 없다, UI에서 숨긴다. 

9. "3장 더 지급" 버튼이 눌리면 선택된 3장을 대체하거나, 3장을 게임에 추가한다.

10. 3장더 지급은 UI에 공간이 부족하거나 덱에 카드가 없을때는 비활성화 되어야한다.

11. 카드를 그릴때 다음 3개의 캐릭터 ▲ ● ■ 를 사용하고 적절하게 그리기 위해서(색상, 쉐이딩) NSAttributedString을 사용한다. 그렇게 했을때 카드는 UIButtons가 될 수 있을것이다. 다양한 카드를 표시하기한 제안이 힌트에 있다.

12. 필요하다고 생각하는 부분에 `클로져`를 인자로 받는 함수를 사용해라.

13. 필요하다고 생각하는 부분에 `enum`을 사용해라.

14. 필요하다고 생각하는 부분에 자료형 extension을 사용해라.

15. UI는 아이폰 7과 이후의 모델에서 잘 레이아웃 되어있어야하며 보기 좋아야한다. 오토 레이아웃과 스택뷰를 사용하여라.

16. Concentration에서 한것처럼 New Game 버튼이 있어야하며 스코어를 보여줘라. 스코어를 어떻게 표시할지는 마음대로 해라. 예를들면, 매치성공시 3포인트 실패시 -5포인트를한다.

## 힌트

1. Concentration과 똑같은 UI Layout mechanism을 사용해도된다. 

2. 카드는 정렬될 필요가 없으며 최대치보다 적게 보여줄수있다 따라서 포지셔닝은 문제되지 않는다. (다음주에 수정함)

3. Array의 원소에 index(of:) 를 사용하기위해서는 Element자료형이 Equatable protocol을 구현해야한다.

4. face up 카드를 추적하는데 Concentration과 같은 구조를 쓰는게 최선이 아닐 수 있다.

5. 4의 힌트를 사용한다면 힌트 3도 주의해야 할 것이다.

6. 선택된 카드를 표시하기위해서 UIButton의 backgroundColor를 사용할 수 있다, 하지만 UIKit은 또한 UIView의 border를 코드로 어떻게 추가하는지 알고 있다.

button.layer.borderWidth = 3.0
button.layer.borderColor = UIColor.blue.cgColor

7. 카드의 코너를 둥글게 할 수 있다.

button.layer.cornerRadius = 8.0

8. NSAttributedString 을 캐릭터로 채우고 싶다면 NSAttributedStringKey.strokeWidth 를 음수로 명시해라.

9. "Striped"를 표시하기위해서, NSAttributedStringKey.foregroundColor 를 15% 알파로 설정해라.
100% 알파는 "filled"처럼 보이게 하고, 양수의 strokeWidth는 "outline"으로 보여준다.

10. 위의것 이외에는 아마도 NSAttributedStringKey.strokeColor만 있으면 충분할 것이다.

11. 색깔은 아무거나 써도된다. "standard" Set color 를 쓰지 않아도 된다.

12. 폰트설정을 주의해라. 일부 폰트는 shape를 다른 사이즈로 표시할 수 있다. systemFont는 문제가 없을것이다.

13. Be sure to use exactly these three Unicode characters: ▲ ● ■. Some other, similar shape characters don’t fill or stroke quite right for our purposes.

14. UIButton의 title과 attributedTitle은 각자 설정될 수 있다. 따라서, 예를들면, UIButton 타이틀을 없애고 싶다면 "둘다" nil로 만들어야 할 것이다.

15. NSAttributedStringKeys는 Model에 사용하기에 적합하지 않다. 모델에서 NSAttributedStrings를 쓰지 마라

16. Shape 이름이나 색상명을 고정해서 명시하지 않는것이 좋은 MVC 디자인일것이다. (과제에서도 스탠다드 모양이아닌 ▲●■를 사용한다)

17. 다음주에는 attributed strings를 사용하지 않을것인데 Model 디자인이 올바르다면 다음주에는 Model에서 한줄의 코드도 수정하지 않을 것이다. 어떻게 유저에게 보여질지 모델에서 추측하지 마라.

18. Set Game은 플레이되고있는 카드들의 리스트가 있다, 선택된 카드들이 있고, 최근에 선택된 카드들이 매치되는지 아닌지 알고있다, 덱이 있고, 아마도 어떤 카드가 이미 매치되었는지 알아야할것이다. 모델의 API는 위의 컨셉들을 명확히 보여야할것이다. 모델의 유일한 기능은 매치시도와 요구시 3개의 카드를 지급하는것이다.

19. UI가 꽉차서 카드를 더 지급하지 못하는것은 UI 작업이다 (Model에서 할 작업이아니다).

20. "게임끝"을 테스트할때 주의하라. When the deck of Set cards runs out, successfully matched cards can no longer be replaced with new cards. Those un-replaced matched cards can’t appear in the UI (otherwise users might try to match them against other cards!). For this reason, your Model’s API will have to reveal which cards have already been successfully matched.

21. Remember that your Model doesn’t actually note successfully matched cards as matched until the next card selection happens or “Deal 3 More Cards” happens (which is fine, you don’t want to hide matched cards from the UI until after the user has had a chance to see that he or she has made a successful match anyway).

22. For testing your end-game, you’ll probably want to temporarily trick your Model into thinking that any 3 cards are a match so you can get to the end-game quickly (unless you’re really, really good at Set!).

23. In terms of scope, you should certainly be able to implement your Model in under 100 lines of code (not counting comments or a curly brace on a line by itself). In fact, it can be accomplished in significantly fewer than that. Your UI (i.e. your ViewController) is probably of similar scope. If you start to need much more than 200 lines of code total to implement the Required Tasks in this assignment, you might have taken a wrong turn somewhere.

