
# Assignment 3: Graphical Set

## Required Tasks

1. 과제 2의 Set에서 이어서 진행할것

2. 이번 버전에서는 UI상에 카드의 수를 제한하지 않는다. 항상 3장 더 지급할 수 있어야한다. 3장 더 지급이 비활성화되는 유일한 경우는 덱이 남아있지 않은 경우이다.

3. 81개의 카드 공간을 미리 할당하지 마라. 화면공간을 최대한으로 활용해서 보여주어야한다. 예를들면 처음에 카드가 12장일 때는 크게 보여주지만 카드를 더 놓으면 작아진다.

4. Towards the end of the game, when 3 cards are matched and there are no more cards
in the Set deck, the matching cards should be removed from the screen entirely and
the remaining cards should “re-form up” to use the space freed up by these departing
cards (i.e. getting a bit larger again if space allows).

5. 카드들은 반드시 "표준" 모양과 느낌이어야 한다. (1, 2, 3 / squiggles, diamonds, ovals / solid, striped, unfilled / green, red, purple). 
UIBezierPath와 CoreGraphics 함수들을 써서 그릴것. attributed strings나 UIImages를 드로잉에 사용하면 안된다.

6. 어떻게 그리던간에 카드 사이즈에 맞게 스케일해서 구려야한다.

7. 1개 이상의 심볼을 그릴때는 수직으로 하거나 수평으로 하거나 상관없다.

8. select/deselect 를 위해서 tap gesture 사용

9. A swipe down gesture in your game should Deal 3 More Cards.

10. Add a rotation gesture (two fingers rotating like turning a knob) to cause all of your cards to randomly reshuffle (it’s useful when the user is “stuck” and can’t find a Set).
This might require a modification to your Model.

11. Your game must work properly and look good in both Landscape and Portrait
orientations on all iPhones and iPads. It should efficiently use all the space available to it in all circumstances.

## Hints

1. You will not be able to use stack views or an outlet collection for your cards in this
assignment because you have to be able to put a lot more cards on screen at the same
time (as many as 81 theoretically) and you can’t preallocate space for them in any case.
The included Grid utility object can help make it really easy to calculate the frames for your cards (which you can set from code).

2. You are not required to use Grid. You can also feel free to modify it if you want
(though you shouldn’t have to).

3. While you won’t be using autolayout or stack views to place your cards themselves
(you’ll be setting their frames directly in code), you will still use autolayout and/or
stack views to place the view that contains all of your cards as subviews as well as all
other UI (score label, Deal 3 More Cards button, etc.).

4. Note that the third kind of “filling” of cards is striping (not shading like last week).
You might find clipping to a path with addClip useful in implementing this one.

5. When you addClip, all future drawing will be clipped (for the rest of your draw()
method’s execution). If you want to “undo” the clip, you’ll want to wrap calls to the
Core Graphics functions saveGState() and restoreGState() around the part of your
drawing you want clipped. The function saveGState() saves the entire graphics state
(including the clipping) at the time you call it, then restoreGState() returns back to
that saved graphics state. You send these functions to the context you get from calling
UIGraphicsGetCurrentContext().

6. Were you able to use your Model untouched from last week (other than the new
requirement of shuffling in response to a rotation gesture)? If not, why not?
Understanding that may help with your understanding of MVC in general.

