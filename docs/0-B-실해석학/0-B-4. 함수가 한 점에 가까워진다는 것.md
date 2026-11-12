# 0-B-4. 함수가 한 점에 가까워진다는 것

## 1. 대입하는 것과 가까워지는 것은 다르다

지난 시간까지 우리는 수열의 극한을 공부했습니다. 수열의 항들이 어떤 실수에 한없이 가까워진다는 말을 정밀하게 정의했고, 어떤 조건에서 극한이 존재하는지도 살펴보았습니다.

이제 함수로 시선을 옮겨 보겠습니다.

다음 함수를 생각해 봅시다.

$$
f(x) = \frac{x^2 - 1}{x - 1}
$$

단, $x = 1$ 에서는 분모가 $0$ 이 되므로 이 함수는 $x = 1$ 에서 정의되지 않습니다.

이제 $x$ 에 여러 값을 대입해 보겠습니다.

| $x$ | $f(x)$ |
|---:|---:|
| $0.9$ | $1.9$ |
| $0.99$ | $1.99$ |
| $0.999$ | $1.999$ |
| $1.001$ | $2.001$ |
| $1.01$ | $2.01$ |
| $1.1$ | $2.1$ |

$x$ 가 $1$ 에 가까워질수록 함숫값은 $2$ 에 가까워지는 것처럼 보입니다. $x$ 가 $1$ 보다 작든 크든 비슷한 현상이 나타납니다.

그런데 여기서 중요한 문제가 생깁니다.

함수의 식에 $x = 1$ 을 직접 대입하면 분모가 $0$ 이 되므로 함숫값을 계산할 수 없습니다. 그런데도 $x$ 가 $1$ 에 가까워질 때 함숫값이 $2$ 에 가까워진다고 말할 수 있을까요?

그렇습니다. 함숫값을 직접 계산할 수 있는지와, 입력값을 어떤 점에 가까이 보낼 때 함숫값이 어떻게 변하는지는 서로 다른 문제이기 때문입니다.

실제로 $x \ne 1$ 이면 분자를 인수분해하여 다음과 같이 정리할 수 있습니다.

$$
f(x) = \frac{(x - 1)(x + 1)}{x - 1} = x + 1
$$

따라서 $x$ 가 $1$ 에 가까워질수록 $f(x)$ 는 $2$ 에 가까워집니다.

여기서 우리는 새로운 질문을 마주하게 됩니다.

**함숫값 $f(1)$ 을 몰라도, 또는 그 값이 정의되어 있지 않아도, $x$ 가 $1$ 에 가까워질 때 함숫값이 $2$ 에 가까워진다는 사실을 어떻게 수학적으로 정밀하게 표현할 수 있을까요?**

수열의 극한을 정의할 때 우리는 극한값과 각 항 사이의 거리를 살펴보았습니다. 함수에서도 비슷한 생각을 적용할 수 있습니다. 다만 이번에는 자연수 $n$ 이 커지는 것이 아니라, 입력값 $x$ 를 우리가 관심 있는 점 $a$ 에 가까운 값으로 바꾸어 가야 합니다.

이 차이를 정밀하게 표현하는 것부터 시작해 봅시다.

## 2. 입력값을 가까이 보낸다는 말의 의미

### 2.1 어느 정도 가까워야 할까?

함수 $f(x)$ 에서 입력값 $x$ 를 $a$ 에 가까운 값으로 바꾼다고 해 봅시다.

예를 들어 $a = 1$ 이라면 다음과 같은 값들을 생각할 수 있습니다.

$$
0.9,\quad 0.99,\quad 1.01,\quad 1.1
$$

이 값들은 모두 $1$ 에 가깝지만, 가까운 정도는 서로 다릅니다. 그렇다면 $x$ 가 $a$ 에 가까워진다는 말을 어떻게 정확하게 표현할 수 있을까요?

두 실수 사이의 거리는 그 차이의 절댓값으로 나타낼 수 있습니다. 따라서 $x$ 와 $a$ 사이의 거리는 다음과 같습니다.

$$
|x - a|
$$

이제 양수 $\delta$ 를 하나 정해 봅시다. $x$ 가 $a$ 로부터 $\delta$ 보다 가까운 곳에 있다는 것은 다음 부등식으로 나타납니다.

$$
|x - a| < \delta
$$

이 부등식은 $x$ 가 다음 열린구간 안에 놓인다는 뜻이기도 합니다.

$$
a - \delta < x < a + \delta
$$

즉, $a$ 를 중심으로 양쪽에 $\delta$ 만큼의 반경을 둔 구간을 생각하는 것입니다.

그런데 여기에는 한 가지 주의할 점이 있습니다. 우리가 알고 싶은 것은 $x = a$ 일 때의 함숫값이 아니라, $x$ 가 $a$ 에 한없이 가까워질 때 함숫값이 다가가는 목표값입니다. 그러므로 $x = a$ 자체는 조사 대상에서 제외해야 합니다.

따라서 입력값의 조건은 다음과 같이 표현됩니다.

$$
0 < |x - a| < \delta
$$

왼쪽 부등식 $0 < |x - a|$ 는 $x \ne a$ 라는 뜻입니다. 오른쪽 부등식은 $x$ 와 $a$ 사이의 거리가 $\delta$ 보다 작다는 뜻입니다.

이렇게 중심점 $a$ 자체를 제외하고 그 주변만을 살펴보는 관점은 함수의 극한을 정의할 때 매우 중요합니다.

### 2.2 입력값의 오차와 함숫값의 오차

이제 앞에서 살펴본 함수를 다시 생각해 봅시다.

$$
f(x) = \frac{x^2 - 1}{x - 1},\qquad x \ne 1
$$

우리는 $x$ 가 $1$ 에 가까워질수록 $f(x)$ 가 $2$ 에 가까워진다고 말하고 싶습니다.

그렇다면 함숫값이 $2$ 에 가까워진다는 말은 어떻게 표현할 수 있을까요?

함숫값 $f(x)$ 와 목표값 $2$ 사이의 거리를 살펴보면 됩니다.

$$
|f(x) - 2|
$$

이 거리가 충분히 작아진다는 것을 보이고 싶은 것입니다.

여기서 두 가지 거리를 엄격히 구별해야 합니다.

- 입력값의 거리: $|x - a|$
- 함숫값의 거리: $|f(x) - L|$

첫 번째는 입력값 $x$ 가 기준점 $a$ 에 얼마나 가까운지를 나타냅니다. 두 번째는 함숫값 $f(x)$ 가 목표값 $L$ 에 얼마나 가까운지를 나타냅니다.

우리가 알고 싶은 것은 이 둘 사이의 인과 관계입니다.

**입력값 $x$ 를 $a$ 에 충분히 가깝게 제한하면, 함숫값 $f(x)$ 를 $L$ 에 원하는 만큼 가깝게 만들 수 있을까요?**

이 물음에 대한 답이 바로 함수의 극한 정의입니다.

## 3. 함수의 극한을 정의하자

### 3.1 함숫값의 오차부터 정하기

함수 $f(x)$ 가 $x = a$ 에서 $L$ 로 수렴한다고 말하고 싶다고 합시다.

수열에서와 마찬가지로, 먼저 함숫값의 오차를 어느 정도까지 허용할 것인지 정해야 합니다. 임의의 양수 $\varepsilon$ 을 주어 다음 조건이 성립하기를 요구하는 것입니다.

$$
|f(x) - L| < \varepsilon
$$

여기서 $\varepsilon$ 은 함숫값과 목표값 $L$ 사이에 허용하는 오차의 한계입니다. $\varepsilon$ 을 작게 잡을수록 함숫값은 $L$ 에 더 엄격하게 붙어 있어야 합니다.

그런데 함숫값의 오차를 통제하려면 입력값 $x$ 가 $a$ 에 충분히 가까워야 합니다.

따라서 허용 오차 $\varepsilon$ 을 먼저 정한 다음, 그 요구를 만족시킬 수 있는 입력값의 제한 거리 $\delta$ 를 찾아내는 구조가 됩니다.

진행 순서는 다음과 같습니다.

1. 함숫값의 허용 오차 $\varepsilon > 0$ 을 정합니다.
2. 그 오차를 보장할 수 있는 입력값의 거리 $\delta > 0$ 를 찾아 제시합니다.
3. $0 < |x - a| < \delta$ 를 만족하는 모든 $x$ 에 대하여, 함숫값이 $|f(x) - L| < \varepsilon$ 안에 들어오는지 확인합니다.

여기서 $\delta$ 는 주어지는 $\varepsilon$ 의 크기에 따라 달라져도 무방합니다. 함숫값의 오차를 더 작게 요구하면 입력값을 더 좁은 범위 안에 가두어야 하기 때문입니다.

이제 이 생각을 수학적 정의로 확립해 보겠습니다.

### 3.2 $\varepsilon$-$\delta$ 정의

> **[정의] 함수의 극한 ($\varepsilon$-$\delta$ 정의)**
>
> 함수 $f$ 가 점 $a$ 를 포함하는 어떤 열린구간(단, $a$ 자체에서는 정의되지 않아도 무방하다)에서 정의되어 있다고 하자.  
> 임의의 양수 $\varepsilon > 0$ 에 대하여 적절한 양수 $\delta > 0$ 가 존재하여,
>
> $$
> 0 < |x - a| < \delta \quad\Longrightarrow\quad |f(x) - L| < \varepsilon
> $$
>
> 이 성립할 때, $x$ 가 $a$ 로 다가갈 때 $f(x)$ 의 극한은 $L$ 이라고 하며, 이를
>
> $$
> \lim_{x\to a} f(x) = L
> $$
>
> 또는 $x \to a$ 일 때 $f(x) \to L$ 로 나타낸다.

여기서 기호 $\Longrightarrow$ 는 앞의 조건이 성립하면 뒤의 결론도 반드시 성립함을 뜻합니다. 즉, $x$ 가 $a$ 로부터 $\delta$ 반경 안에 들어오기만 하면(단, $x \ne a$), 함숫값은 예외 없이 $L$ 의 $\varepsilon$ 반경 안에 안착해야 한다는 뜻입니다.

이 정의에서 핵심은 $\varepsilon$ 과 $\delta$ 를 선택하는 순서입니다.

상대방이 먼저 함숫값의 오차 $\varepsilon$ 을 제시합니다. 우리는 그 오차를 만족시킬 수 있는 입력값의 허용 범위 $\delta$ 를 찾아 응답해야 합니다. 그리고 그 $\delta$ 구간 안에 들어오는 모든 $x$ 에 대해 오차 조건이 유지되어야 합니다.

특정한 몇몇 입력값에서만 성립하는 것으로는 부족하며, 구간 안의 모든 입력값에 대해 성립해야 합니다.

수열의 수렴 정의와 비교해 보면 그 본질이 완전히 같음을 알 수 있습니다. 수열에서는 충분히 큰 자연수 $N$ 이후의 모든 항이 오차 범위 안에 들어오도록 $N$ 을 잡았고, 함수에서는 점 $a$ 로부터 충분히 가까운 반경 $\delta$ 안의 모든 함숫값이 오차 범위 안에 들어오도록 $\delta$ 를 잡는 것입니다.

두 정의는 표현 대상만 다를 뿐, **허용 오차를 먼저 설정하고 그 오차를 완벽히 통제할 수 있는 입력의 한계를 결정한다** 는 동일한 원리를 공유하고 있습니다.



<div class="card" style="margin: 2em 0; padding: 18px 12px; text-align: center; overflow-x: auto;">
<svg viewBox="0 0 760 320" width="100%" height="auto" xmlns="http://www.w3.org/2000/svg">
<defs>
<style>
.math-sym { font-family: 'KaTeX_Math', 'KaTeX_Main', 'Cambria Math', 'Times New Roman', serif; font-style: italic; }
.math-bb { font-family: 'KaTeX_AMS', 'KaTeX_Main', 'Times New Roman', serif; font-style: normal; font-weight: bold; }
.math-main { font-family: 'KaTeX_Main', 'Times New Roman', serif; font-style: normal; }
.desc-txt { font-family: var(--font-family-body, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif); font-weight: 500; }
</style>
<marker id="arr-primary" viewBox="0 0 10 10" refX="7" refY="5" markerWidth="7" markerHeight="7" orient="auto">
<path d="M 0 1.5 L 8 5 L 0 8.5 z" fill="#2563eb" />
</marker>
<marker id="arr-text" viewBox="0 0 10 10" refX="7" refY="5" markerWidth="7" markerHeight="7" orient="auto">
<path d="M 0 1.5 L 8 5 L 0 8.5 z" fill="#334155" />
</marker>
<marker id="arr-sub" viewBox="0 0 10 10" refX="7" refY="5" markerWidth="7" markerHeight="7" orient="auto">
<path d="M 0 1.5 L 8 5 L 0 8.5 z" fill="#64748b" />
</marker>
</defs>
<rect x="8" y="8" width="744" height="304" rx="12" fill="var(--card-bg, #f8fafc)" stroke="var(--border-color, #cbd5e1)" stroke-width="1.2" />
<text x="380" y="32" text-anchor="middle" font-size="14" fill="var(--title-color, #0f172a)" class="desc-txt">[도식 1] 함수의 극한 <tspan class="math-main">lim</tspan><tspan dy="3" font-size="8.5" class="math-sym">x→a</tspan><tspan dy="-3"> </tspan><tspan class="math-sym">f</tspan><tspan class="math-main">(</tspan><tspan class="math-sym">x</tspan><tspan class="math-main">) = </tspan><tspan class="math-sym">L</tspan> 의 <tspan class="math-sym">ε</tspan>-<tspan class="math-sym">δ</tspan> 정의역·공역 사상과 그래프 창문</text>
<rect x="30" y="52" width="335" height="242" rx="8" fill="var(--paper-bg, #ffffff)" stroke="var(--border-color, #94a3b8)" stroke-width="1.4" />
<text x="197" y="74" text-anchor="middle" font-size="12" fill="var(--primary-color, #2563eb)" class="desc-txt">1) 정의역의 뚫린 <tspan class="math-sym">δ</tspan>-근방에서 공역의 <tspan class="math-sym">ε</tspan>-근방으로의 사상</text>
<rect x="75" y="102" width="245" height="26" rx="4" fill="var(--primary-color, #2563eb)" fill-opacity="0.08" />
<line x1="55" y1="115" x2="340" y2="115" stroke="var(--text-color, #334155)" stroke-width="1.5" marker-end="url(#arr-text)" />
<circle cx="197" cy="115" r="4.5" fill="var(--paper-bg, #ffffff)" stroke="var(--primary-color, #2563eb)" stroke-width="2" />
<circle cx="242" cy="115" r="4" fill="var(--primary-color, #2563eb)" />
<text x="80" y="96" font-size="11" fill="var(--title-color, #0f172a)" class="desc-txt">[정의역] <tspan class="math-main">0 &lt; |</tspan><tspan class="math-sym">x − a</tspan><tspan class="math-main">| &lt; </tspan><tspan class="math-sym">δ</tspan></text>
<text x="197" y="138" text-anchor="middle" font-size="11.5" fill="var(--title-color, #0f172a)" class="math-sym">a<tspan class="desc-txt" font-size="10"> (제외)</tspan></text>
<text x="242" y="138" text-anchor="middle" font-size="11.5" fill="var(--primary-color, #2563eb)" class="math-sym">x</text>
<path d="M 242 145 L 228 205" fill="none" stroke="var(--primary-color, #2563eb)" stroke-width="2.2" marker-end="url(#arr-primary)" />
<text x="255" y="178" font-size="12" fill="var(--primary-color, #2563eb)" class="math-sym">f</text>
<rect x="75" y="215" width="245" height="26" rx="4" fill="var(--primary-color, #2563eb)" fill-opacity="0.08" />
<line x1="55" y1="228" x2="340" y2="228" stroke="var(--text-color, #334155)" stroke-width="1.5" marker-end="url(#arr-text)" />
<circle cx="197" cy="228" r="4.5" fill="var(--title-color, #0f172a)" />
<circle cx="225" cy="228" r="4" fill="var(--primary-color, #2563eb)" />
<text x="80" y="262" font-size="11" fill="var(--primary-color, #2563eb)" class="desc-txt">[공역] <tspan class="math-main">|</tspan><tspan class="math-sym">f</tspan><tspan class="math-main">(</tspan><tspan class="math-sym">x</tspan><tspan class="math-main">) − </tspan><tspan class="math-sym">L</tspan><tspan class="math-main">| &lt; </tspan><tspan class="math-sym">ε</tspan></text>
<text x="197" y="250" text-anchor="middle" font-size="11.5" fill="var(--title-color, #0f172a)" class="math-sym">L</text>
<text x="232" y="250" text-anchor="start" font-size="11.5" fill="var(--primary-color, #2563eb)" class="math-sym">f<tspan class="math-main">(</tspan>x<tspan class="math-main">)</tspan></text>
<rect x="390" y="52" width="340" height="242" rx="8" fill="var(--paper-bg, #ffffff)" stroke="var(--border-color, #94a3b8)" stroke-width="1.4" />
<text x="560" y="74" text-anchor="middle" font-size="12" fill="var(--primary-color, #2563eb)" class="desc-txt">2) 좌표평면에서의 <tspan class="math-sym">ε</tspan>-<tspan class="math-sym">δ</tspan> 허용 상자</text>
<rect x="445" y="118" width="235" height="68" fill="var(--primary-color, #2563eb)" fill-opacity="0.06" />
<rect x="525" y="92" width="80" height="150" fill="var(--primary-color, #2563eb)" fill-opacity="0.06" />
<line x1="435" y1="242" x2="695" y2="242" stroke="var(--text-color, #334155)" stroke-width="1.5" marker-end="url(#arr-text)" />
<line x1="445" y1="252" x2="445" y2="85" stroke="var(--text-color, #334155)" stroke-width="1.5" marker-end="url(#arr-text)" />
<line x1="445" y1="118" x2="680" y2="118" stroke="var(--primary-color, #2563eb)" stroke-width="1.2" stroke-dasharray="4,3" />
<line x1="445" y1="152" x2="680" y2="152" stroke="var(--sub-color, #64748b)" stroke-width="1.2" stroke-dasharray="3,3" />
<line x1="445" y1="186" x2="680" y2="186" stroke="var(--primary-color, #2563eb)" stroke-width="1.2" stroke-dasharray="4,3" />
<line x1="525" y1="92" x2="525" y2="242" stroke="var(--primary-color, #2563eb)" stroke-width="1.2" stroke-dasharray="4,3" />
<line x1="565" y1="92" x2="565" y2="242" stroke="var(--sub-color, #64748b)" stroke-width="1.2" stroke-dasharray="3,3" />
<line x1="605" y1="92" x2="605" y2="242" stroke="var(--primary-color, #2563eb)" stroke-width="1.2" stroke-dasharray="4,3" />
<path d="M 465 215 Q 545 172 655 102" fill="none" stroke="var(--primary-color, #2563eb)" stroke-width="2.5" />
<circle cx="565" cy="152" r="5" fill="var(--paper-bg, #ffffff)" stroke="var(--primary-color, #2563eb)" stroke-width="2.2" />
<text x="438" y="122" text-anchor="end" font-size="10.5" fill="var(--primary-color, #2563eb)" class="math-sym">L<tspan class="math-main">+</tspan>ε</text>
<text x="438" y="156" text-anchor="end" font-size="11" fill="var(--title-color, #0f172a)" class="math-sym">L</text>
<text x="438" y="190" text-anchor="end" font-size="10.5" fill="var(--primary-color, #2563eb)" class="math-sym">L<tspan class="math-main">−</tspan>ε</text>
<text x="525" y="258" text-anchor="middle" font-size="10.5" fill="var(--primary-color, #2563eb)" class="math-sym">a<tspan class="math-main">−</tspan>δ</text>
<text x="565" y="258" text-anchor="middle" font-size="11" fill="var(--title-color, #0f172a)" class="math-sym">a</text>
<text x="605" y="258" text-anchor="middle" font-size="10.5" fill="var(--primary-color, #2563eb)" class="math-sym">a<tspan class="math-main">+</tspan>δ</text>
<text x="565" y="280" text-anchor="middle" font-size="11" fill="var(--text-color, #334155)" class="desc-txt"><tspan class="math-sym">x</tspan> 가 <tspan class="math-sym">δ</tspan>-구간에 들어오면 그래프가 <tspan class="math-sym">ε</tspan>-띠 안에 갇힘</text>
</svg>
</div>

### 3.3 정의를 실제로 사용해 보자

다음 일차함수의 극한을 살펴보겠습니다.

$$
f(x) = 2x + 1
$$

$x$ 가 $3$ 에 가까워질 때 함숫값은 $7$ 에 가까워질 것으로 예상할 수 있습니다.

$$
\lim_{x\to 3} (2x + 1) = 7
$$

이것을 $\varepsilon$-$\delta$ 정의를 이용하여 직접 증명해 보겠습니다.

임의의 $\varepsilon > 0$ 을 택합니다. 우리가 해야 할 일은 적절한 $\delta > 0$ 를 찾아 다음 조건이 성립하도록 만드는 것입니다.

$$
0 < |x - 3| < \delta \quad\Longrightarrow\quad |(2x + 1) - 7| < \varepsilon
$$

함숫값의 오차를 정리하면 다음과 같습니다.

$$
|(2x + 1) - 7| = |2x - 6| = 2|x - 3|
$$

따라서 함숫값의 오차가 $\varepsilon$ 보다 작아지려면 다음이 성립하면 충분합니다.

$$
2|x - 3| < \varepsilon \quad\Longleftrightarrow\quad |x - 3| < \frac{\varepsilon}{2}
$$

그러므로 $\delta$ 를 다음과 같이 선택하면 됩니다.

$$
\delta = \frac{\varepsilon}{2}
$$

실제로 $0 < |x - 3| < \delta$ 이면

$$
|(2x + 1) - 7| = 2|x - 3| < 2\delta = 2\left(\frac{\varepsilon}{2}\right) = \varepsilon
$$

이 성립합니다.

임의의 양수 $\varepsilon$ 에 대하여 적절한 양수 $\delta$ 를 찾아 제시했으므로, 극한의 정의에 의해 다음이 증명되었습니다.

$$
\boxed{\lim_{x\to 3} (2x + 1) = 7}
$$

이 예제에서는 입력값의 오차를 함숫값 오차의 절반으로 제어함으로써 증명을 완성할 수 있었습니다. 일차함수였기 때문에 계산이 매우 명쾌했습니다.

그러나 일반적으로 함수가 복잡해지면 적절한 $\delta$ 를 찾아내는 과정에서 한 단계 더 깊은 조작이 필요합니다.

### 3.4 제곱함수의 극한

다음 극한을 증명해 보겠습니다.

$$
\lim_{x\to 2} x^2 = 4
$$

임의의 $\varepsilon > 0$ 을 택합니다. 우리가 원하는 것은

$$
0 < |x - 2| < \delta \quad\Longrightarrow\quad |x^2 - 4| < \varepsilon
$$

이 성립하도록 하는 $\delta > 0$ 를 찾는 일입니다.

함숫값의 오차를 인수분해하면 다음과 같습니다.

$$
|x^2 - 4| = |x - 2||x + 2|
$$

여기서 문제가 나타납니다. $|x - 2|$ 는 우리가 $\delta$ 를 조정하여 얼마든지 작게 만들 수 있지만, 함께 곱해져 있는 인수 $|x + 2|$ 는 $x$ 의 움직임에 따라 변합니다. 따라서 $|x - 2|$ 만을 제어해서는 전체 오차를 곧바로 통제할 수 없습니다.

이 문제를 해결하기 위해, 먼저 $x$ 를 $2$ 의 충분히 가까운 근방에 가두어 $|x + 2|$ 의 상계를 고정해 줍니다.

예를 들어 $x$ 가 $2$ 로부터 거리 $1$ 이내에 머무르도록 사전에 제한해 보겠습니다.

$$
|x - 2| < 1
$$

절댓값을 풀면 다음과 같습니다.

$$
-1 < x - 2 < 1 \quad\Longrightarrow\quad 1 < x < 3
$$

각 변에 $2$ 를 더하면

$$
3 < x + 2 < 5
$$

가 되므로, 다음 부등식을 얻습니다.

$$
|x + 2| < 5
$$

이제 함숫값의 오차를 $|x - 2|$ 에 대한 단순한 일차식 형태로 상한을 둘 수 있습니다.

$$
|x^2 - 4| = |x - 2||x + 2| < 5|x - 2|
$$

따라서 $|x - 2| < \varepsilon / 5$ 가 되도록 만들면 전체 함숫값 오차도 $\varepsilon$ 보다 작아집니다.

우리는 두 가지 조건($|x - 2| < 1$ 과 $|x - 2| < \varepsilon / 5$)을 동시에 만족시켜야 하므로, $\delta$ 를 두 값 중 더 작은 쪽으로 선택하면 됩니다.

$$
\delta = \min\left\{ 1,\ \frac{\varepsilon}{5} \right\}
$$

실제로 $0 < |x - 2| < \delta$ 이면, $\delta \le 1$ 이므로 $|x + 2| < 5$ 가 보장되고, $\delta \le \varepsilon / 5$ 이므로

$$
|x^2 - 4| = |x - 2||x + 2| < 5|x - 2| < 5\delta \le 5\left(\frac{\varepsilon}{5}\right) = \varepsilon
$$

을 얻습니다.

따라서 정의에 의해 다음이 성립합니다.

$$
\boxed{\lim_{x\to 2} x^2 = 4}
$$

이 증명에서 중요한 것은 $\delta = \min\{1, \varepsilon / 5\}$ 라는 형태 자체를 암기하는 것이 아닙니다. 다음과 같은 해석학의 전형적인 통제 전략을 익히는 데 있습니다.

1. 함숫값의 오차 $|f(x) - L|$ 을 식 변형을 통해 $|x - a|$ 가 드러나도록 분해합니다.
2. 함께 나타난 다른 인수들을 통제하기 위해, 사전에 임의의 고정된 반경(예: $\delta \le 1$)을 두어 그 인수의 최댓값을 제한합니다.
3. 제한된 상수를 바탕으로 전체 오차가 $\varepsilon$ 미만이 되도록 하는 추가적인 $\delta$ 조건을 설정합니다.
4. 두 제약 조건을 동시에 만족하는 최소값으로 최종 $\delta$ 를 결정합니다.

## 4. 극한값은 하나뿐일까?

수열의 극한을 배울 때 우리는 수렴하는 수열의 극한값이 유일하다는 사실을 증명했습니다. 함수의 극한에서도 동일한 성질이 성립할까요?

예를 들어 $x$ 가 $a$ 에 가까워질 때 함숫값이 $L$ 에도 가까워지고 동시에 서로 다른 $M$ 에도 가까워질 수 있을까요? 만약 서로 다른 두 목적지가 동시에 허용된다면, 극한은 함수의 거동을 명확하게 규정할 수 없게 됩니다.

> **[정리] 극한의 유일성**
>
> 함수 $f$ 가 $x = a$ 에서 $L$ 로 수렴하고 동시에 $M$ 으로 수렴한다면 $L = M$ 이다.

**증명**

$L \ne M$ 이라고 가정하겠습니다. 그러면 두 실수 사이의 거리는 양수입니다.

$$
|L - M| > 0
$$

이제 오차 한계를 두 점 사이의 거리의 3분의 1로 정하겠습니다.

$$
\varepsilon = \frac{|L - M|}{3}
$$

$f(x)$ 가 $L$ 로 수렴하므로, 적절한 양수 $\delta_1 > 0$ 가 존재하여 $0 < |x - a| < \delta_1$ 일 때 다음이 성립합니다.

$$
|f(x) - L| < \frac{|L - M|}{3}
$$

마찬가지로 $f(x)$ 가 $M$ 으로도 수렴하므로, 적절한 양수 $\delta_2 > 0$ 가 존재하여 $0 < |x - a| < \delta_2$ 일 때 다음이 성립합니다.

$$
|f(x) - M| < \frac{|L - M|}{3}
$$

이제 $\delta = \min\{\delta_1, \delta_2\}$ 로 잡고, $0 < |x - a| < \delta$ 를 만족하는 점 $x$ 를 하나 선택합니다. 삼각부등식을 적용하면 다음과 같습니다.

$$
\begin{aligned}
|L - M| &= |(L - f(x)) + (f(x) - M)| \\
&\le |L - f(x)| + |f(x) - M| \\
&< \frac{|L - M|}{3} + \frac{|L - M|}{3} \\
&= \frac{2}{3}|L - M|
\end{aligned}
$$

이는 양수 $|L - M|$ 이 자기 자신의 $\frac{2}{3}$ 보다 작다는 모순을 낳습니다.

따라서 최초의 가정 $L \ne M$ 은 거짓이며, 반드시

$$
\boxed{L = M}
$$

이어야 합니다. 증명이 끝났습니다.

## 5. 함수의 극한도 계산할 수 있을까?

앞에서는 극한의 정의를 이용해 주어진 값을 직접 증명했습니다. 하지만 매번 복잡한 $\varepsilon$-$\delta$ 증법을 거쳐야만 극한값을 계산할 수 있다면 실제 응용에서 매우 비효율적입니다.

수열에서도 기본 성질들을 바탕으로 사칙연산 법칙을 유도했던 것처럼, 함수의 극한에서도 연산 법칙을 확립할 수 있습니다.

### 5.1 합과 차의 극한

> **[정리] 합과 차의 극한 법칙**
>
> $\lim_{x\to a} f(x) = L$ 이고 $\lim_{x\to a} g(x) = M$ 이면 다음이 성립한다.
>
> $$
> \lim_{x\to a} (f(x) + g(x)) = L + M
> $$
>
> $$
> \lim_{x\to a} (f(x) - g(x)) = L - M
> $$

합에 대한 오차를 계산해 보면 삼각부등식에 의해 다음과 같이 분리됩니다.

$$
|(f(x) + g(x)) - (L + M)| \le |f(x) - L| + |g(x) - M|
$$

임의의 $\varepsilon > 0$ 에 대하여 두 함수의 오차를 각각 $\varepsilon / 2$ 보다 작게 만들어 주는 입력 반경 $\delta_1, \delta_2$ 를 잡을 수 있습니다. 그 둘 중 더 작은 $\delta = \min\{\delta_1, \delta_2\}$ 를 택하면 전체 오차는 $\varepsilon / 2 + \varepsilon / 2 = \varepsilon$ 미만이 됩니다.

차의 극한 역시 $|(f(x) - g(x)) - (L - M)| \le |f(x) - L| + |g(x) - M|$ 이므로 완전히 동일한 논리로 증명됩니다.

### 5.2 상수배의 극한

> **[정리] 상수배의 극한 법칙**
>
> $\lim_{x\to a} f(x) = L$ 이고 $c$ 가 임의의 실수이면 다음이 성립한다.
>
> $$
> \lim_{x\to a} c f(x) = c L
> $$

$c = 0$ 이면 좌우변이 모두 $0$ 이므로 자명합니다. $c \ne 0$ 일 때는 오차가 다음과 같습니다.

$$
|c f(x) - c L| = |c||f(x) - L|
$$

따라서 주어진 $\varepsilon > 0$ 에 대하여 $|f(x) - L| < \varepsilon / |c|$ 가 되도록 $\delta$ 를 선택하면 충분합니다.

### 5.3 곱의 극한

> **[정리] 곱의 극한 법칙**
>
> $\lim_{x\to a} f(x) = L$ 이고 $\lim_{x\to a} g(x) = M$ 이면 다음이 성립한다.
>
> $$
> \lim_{x\to a} f(x)g(x) = L M
> $$

곱의 오차는 다음과 같은 표준적인 항 분리를 통해 분석할 수 있습니다.

$$
f(x)g(x) - L M = f(x)(g(x) - M) + M(f(x) - L)
$$

따라서 삼각부등식을 적용하면 다음과 같습니다.

$$
|f(x)g(x) - L M| \le |f(x)||g(x) - M| + |M||f(x) - L|
$$

여기서 $|g(x) - M|$ 과 $|f(x) - L|$ 은 극한의 수렴성에 의해 원하는 만큼 작게 만들 수 있습니다. 다만 첫 번째 항에 남아 있는 $|f(x)|$ 가 통제되어야 합니다.

$f(x) \to L$ 이므로, 적절한 $\delta_1 > 0$ 이 존재하여 $0 < |x - a| < \delta_1$ 일 때 $|f(x) - L| < 1$ 을 만족하도록 할 수 있습니다. 그러면 삼각부등식에 의해

$$
|f(x)| \le |f(x) - L| + |L| < 1 + |L|
$$

이 성립하여 $|f(x)|$ 는 일정한 상수로 유계가 됩니다. 이 유계성을 바탕으로 각 오차 항을 적절히 조절하면 곱의 전체 오차 역시 $\varepsilon$ 보다 작게 만들 수 있습니다.

### 5.4 몫의 극한

> **[정리] 몫의 극한 법칙**
>
> $\lim_{x\to a} f(x) = L$ 이고 $\lim_{x\to a} g(x) = M$ 이며 $M \ne 0$ 이면 다음이 성립한다.
>
> $$
> \lim_{x\to a} \frac{f(x)}{g(x)} = \frac{L}{M}
> $$

몫의 법칙에서는 분모의 극한값이 $0$ 이 아니라는 조건($M \ne 0$)이 본질적인 역할을 합니다.

$g(x) \to M$ 이고 $M \ne 0$ 이므로, $x$ 가 $a$ 에 충분히 가까우면 분모의 오차를 $|M| / 2$ 보다 작게 만들 수 있습니다. 즉,

$$
|g(x) - M| < \frac{|M|}{2}
$$

가 성립합니다. 삼각부등식에 의해

$$
|M| \le |M - g(x)| + |g(x)| \quad\Longrightarrow\quad |g(x)| \ge |M| - |g(x) - M| > \frac{|M|}{2}
$$

를 얻습니다.

따라서 분모는 $0$ 으로부터 최소 $|M| / 2$ 만큼 떨어져 있게 되며, 분모의 역수 크기는 $2 / |M|$ 이하로 안전하게 제한됩니다. 이 사실과 분자의 오차 조절을 결합하면 몫의 수렴성 역시 정밀하게 증명됩니다.

### 5.5 수열을 이용한 함수의 극한 판정법 (하이네 정리)

0-B-2와 0-B-3에서 다룬 수열의 극한과 이번 장에서 정의한 함수의 $\varepsilon$-$\delta$ 극한은 서로 어떻게 연결될까요? 점 $a$ 로 다가가는 입력값들의 수열 $(x_n)$ 을 관찰하면 두 극한 개념이 완벽하게 동치임을 확인할 수 있습니다.

> **[정리] 함수의 극한에 대한 수열 판정법 (Sequential Criterion / Heine's Theorem)**
>
> 함수 $f$ 가 점 $a$ 의 뚫린 근방에서 정의되어 있을 때, 다음 두 명제는 서로 동치이다.
> 1. $\lim_{x\to a} f(x) = L$ 이다.
> 2. $a$ 가 아닌 점들로 이루어지고 $\lim_{n\to\infty} x_n = a$ 를 만족하는 모든 수열 $(x_n)$ 에 대하여 $\lim_{n\to\infty} f(x_n) = L$ 이다.

**증명**

$(1 \Longrightarrow 2)$ $\lim_{x\to a} f(x) = L$ 이라 하고, $x_n \ne a$ 이면서 $x_n \to a$ 인 임의의 수열 $(x_n)$ 을 생각합시다. 임의의 $\varepsilon > 0$ 에 대하여 함수의 극한 정의에 따라, $0 < |x - a| < \delta \implies |f(x) - L| < \varepsilon$ 을 만족하는 $\delta > 0$ 가 존재합니다. 이제 양수 $\delta$ 에 대하여 수열 $x_n \to a$ 의 수렴 정의를 적용하면, 자연수 $N$ 이 존재하여 $n \ge N$ 일 때 $0 < |x_n - a| < \delta$ 가 성립합니다. 따라서 $n \ge N$ 인 모든 $n$ 에 대하여 $|f(x_n) - L| < \varepsilon$ 이므로 $\lim_{n\to\infty} f(x_n) = L$ 입니다.

$(2 \Longrightarrow 1)$ 대우 명제를 증명합시다. 만약 $\lim_{x\to a} f(x) = L$ 이 아니라면, 어떤 $\varepsilon_0 > 0$ 이 존재하여 아무리 작은 $\delta > 0$ 를 잡아도 $0 < |x - a| < \delta$ 이면서 $|f(x) - L| \ge \varepsilon_0$ 인 점 $x$ 가 적어도 하나 존재합니다. 특히 각 자연수 $n$ 마다 $\delta = 1/n$ 로 두면,
$$
0 < |x_n - a| < \frac{1}{n} \qquad\text{이면서}\qquad |f(x_n) - L| \ge \varepsilon_0
$$
를 만족하는 점 $x_n$ 을 선택할 수 있습니다. 이렇게 만든 수열 $(x_n)$ 은 조임 정리에 의해 $x_n \to a$ ($x_n \ne a$)를 만족하지만, $(f(x_n))$ 은 $L$ 로 수렴하지 않으므로 조건 2에 모순입니다. 증명이 끝났습니다.

이 수열 판정법은 두 가지 방면에서 매우 강력하게 쓰입니다. 첫째, 서로 다른 두 수열 $x_n \to a$, $y_n \to a$ 에 대해 $\lim f(x_n) \ne \lim f(y_n)$ 임을 보이면 함수의 극한이 존재하지 않음을 즉시 판정할 수 있습니다. 둘째, 다음 장(0-B-5)에서 볼차노–바이어슈트라스 정리를 이용해 연속함수의 최대·최소 정리를 증명할 때 수열의 극한을 함수의 극한으로 연결하는 다리 역할을 합니다.

## 6. 극한과 함숫값은 어떤 관계일까?

이제 처음에 던졌던 질문으로 되돌아가 보겠습니다.

함수의 극한은 $x$ 가 기준점 $a$ 에 한없이 가까워질 때 함숫값이 다가가는 경향성을 나타냅니다. 그렇다면 기준점에서의 실제 함숫값은 극한과 어떤 관계를 맺고 있을까요?

다음 함수를 다시 관찰해 봅시다.

$$
f(x) =
\begin{cases}
\dfrac{x^2 - 1}{x - 1}, & x \ne 1, \\
5, & x = 1
\end{cases}
$$

이 함수는 $x = 1$ 에서 명시적으로 $f(1) = 5$ 라는 값을 갖습니다. 하지만 $x \ne 1$ 일 때 $f(x) = x + 1$ 이므로 극한값은 다음과 같습니다.

$$
\lim_{x\to 1} f(x) = 2
$$

즉,

$$
\lim_{x\to 1} f(x) = 2 \qquad\text{이지만}\qquad f(1) = 5
$$

입니다.

함수의 극한값과 그 점에서의 실제 함숫값은 전혀 다른 대상일 수 있습니다. 극한은 기준점 주변에서 일어나는 점진적인 동태를 규정하고, 함숫값 $f(a)$ 는 바로 그 정점에 정적으로 정의된 단 하나의 값이기 때문입니다.

그렇다면 이 두 값이 일치하는 특수한 상황은 어떤 의미를 가질까요?

### 6.1 연속이라는 개념을 향하여

함수 $f$ 가 점 $a$ 에서 정의되어 있고, 주변에서 다가가는 극한값과 그 점에서의 함숫값이 정확히 들어맞는 경우를 생각해 보겠습니다.

$$
\lim_{x\to a} f(x) = f(a)
$$

이것은 주변에서 다가가는 경로와 실제 점이 한 치의 어긋남 없이 매끄럽게 연결되어 있음을 뜻합니다. 수학에서는 이 성질을 **연속(continuity)** 이라고 부릅니다.

> **[정의] 함수의 연속**
>
> 함수 $f$ 가 점 $a$ 를 포함하는 어떤 구간에서 정의되어 있고, 다음 조건
>
> $$
> \lim_{x\to a} f(x) = f(a)
> $$
>
> 을 만족할 때, 함수 $f$ 는 점 $a$ 에서 **연속(continuous)** 이라고 한다.  
> 즉, 다음 세부 조건을 모두 만족해야 한다.
> 1. 함숫값 $f(a)$ 가 정의되어 있다.
> 2. 극한값 $\lim_{x\to a} f(x)$ 가 존재한다.
> 3. $\lim_{x\to a} f(x) = f(a)$ 이다.

앞서 살펴본 함수에서 $f(1) = 5$ 로 주어진 경우에는 극한값이 $2$ 이므로 연속이 아닙니다. 

반면 $f(1) = 2$ 로 설정된 함수는 극한값과 함숫값이 일치하므로 $x = 1$ 에서 연속이 됩니다.

이 예시는 연속성의 직관을 선명하게 보여 줍니다. 함숫값이 주변의 극한값과 완벽하게 일치할 때, 그래프는 빈 구멍이나 도약 없이 끊어지지 않고 온전히 이어지게 됩니다.

### 6.2 극한이 존재하지 않는 경우

모든 함수가 한 점에서 극한을 가지는 것은 아닙니다. 다음 부호 함수를 살펴보겠습니다.

$$
f(x) =
\begin{cases}
-1, & x < 0, \\
1, & x \ge 0
\end{cases}
$$

$x$ 가 $0$ 보다 작은 쪽에서 $0$ 에 다가가면 함숫값은 줄곧 $-1$ 을 유지합니다. 반대로 $x$ 가 $0$ 보다 큰 쪽에서 다가가면 함숫값은 항상 $1$ 입니다.

왼쪽에서 다가갈 때의 목적지와 오른쪽에서 다가갈 때의 목적지가 서로 다르기 때문에, 양쪽을 종합적으로 통제하는 단 하나의 극한값 $L$ 은 존재할 수 없습니다.

이 사례는 함수가 한 점에서 정의되어 있다고 하더라도 그 점에서 극한이 반드시 존재하는 것은 아니라는 사실을 명확히 보여 줍니다.

또한 극한이 존재하지 않는 원인이 반드시 함수가 무한대로 발산하기 때문만은 아닙니다. 이 함수의 값은 항상 $-1$ 또는 $1$ 사이에 갇혀 있어 유계이지만, 양방향의 목표값이 서로 엇갈리기 때문에 극한이 존재하지 않는 것입니다.

따라서 함수의 극한을 판정할 때는 단순히 함숫값이 유계인가를 확인하는 것으로는 불충분하며, 입력값이 다가감에 따라 함숫값들이 단 하나의 일관된 목표점으로 응집하는지를 확인해야 합니다.

이처럼 입력값 $x$ 가 기준점 $a$ 의 한쪽 방향에서만 다가갈 때의 극한을 각각 **우극한**과 **좌극한**으로 정밀하게 정의합니다.

> **[정의 및 정리] 우극한과 좌극한 (One-sided Limits)**
>
> - **(우극한)** 임의의 $\varepsilon > 0$ 에 대하여 적절한 $\delta > 0$ 가 존재하여 $a < x < a + \delta \implies |f(x) - L_+| < \varepsilon$ 이 성립할 때, $L_+$ 를 $a$ 에서의 **우극한(right-hand limit)** 이라 하고 $\lim_{x\to a^+} f(x) = L_+$ 로 표기한다.
> - **(좌극한)** 임의의 $\varepsilon > 0$ 에 대하여 적절한 $\delta > 0$ 가 존재하여 $a - \delta < x < a \implies |f(x) - L_-| < \varepsilon$ 이 성립할 때, $L_-$ 를 $a$ 에서의 **좌극한(left-hand limit)** 이라 하고 $\lim_{x\to a^-} f(x) = L_-$ 로 표기한다.
> - **(양방향 극한과의 동치 관계)** $\lim_{x\to a} f(x) = L$ 일 필요충분조건은 우극한과 좌극한이 모두 존재하고 그 값이 $L$ 로 일치하는 것이다($\delta = \min(\delta_+, \delta_-)$ 선택).
> $$
> \lim_{x\to a} f(x) = L \quad\Longleftrightarrow\quad \lim_{x\to a^-} f(x) = \lim_{x\to a^+} f(x) = L
> $$

<div class="card" style="margin: 2em 0; padding: 18px 12px; text-align: center; overflow-x: auto;">
<svg viewBox="0 0 760 300" width="100%" height="auto" xmlns="http://www.w3.org/2000/svg">
<defs>
<style>
.math-sym { font-family: 'KaTeX_Math', 'KaTeX_Main', 'Cambria Math', 'Times New Roman', serif; font-style: italic; }
.math-bb { font-family: 'KaTeX_AMS', 'KaTeX_Main', 'Times New Roman', serif; font-style: normal; font-weight: bold; }
.math-main { font-family: 'KaTeX_Main', 'Times New Roman', serif; font-style: normal; }
.desc-txt { font-family: var(--font-family-body, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif); font-weight: 500; }
</style>
<marker id="arr-primary" viewBox="0 0 10 10" refX="7" refY="5" markerWidth="7" markerHeight="7" orient="auto">
<path d="M 0 1.5 L 8 5 L 0 8.5 z" fill="#2563eb" />
</marker>
<marker id="arr-text" viewBox="0 0 10 10" refX="7" refY="5" markerWidth="7" markerHeight="7" orient="auto">
<path d="M 0 1.5 L 8 5 L 0 8.5 z" fill="#334155" />
</marker>
<marker id="arr-sub" viewBox="0 0 10 10" refX="7" refY="5" markerWidth="7" markerHeight="7" orient="auto">
<path d="M 0 1.5 L 8 5 L 0 8.5 z" fill="#64748b" />
</marker>
</defs>
<rect x="8" y="8" width="744" height="284" rx="12" fill="var(--card-bg, #f8fafc)" stroke="var(--border-color, #cbd5e1)" stroke-width="1.2" />
<text x="380" y="32" text-anchor="middle" font-size="14" fill="var(--title-color, #0f172a)" class="desc-txt">[도식 2] 극한값과 함숫값의 비교 및 좌극한·우극한의 불일치</text>
<rect x="30" y="52" width="340" height="222" rx="8" fill="var(--paper-bg, #ffffff)" stroke="var(--border-color, #94a3b8)" stroke-width="1.4" />
<text x="200" y="74" text-anchor="middle" font-size="12" fill="var(--primary-color, #2563eb)" class="desc-txt">1) 극한은 존재하지만 함숫값과 다른 경우 (<tspan class="math-sym">L</tspan><tspan class="math-main"> ≠ </tspan><tspan class="math-sym">f</tspan><tspan class="math-main">(</tspan><tspan class="math-sym">a</tspan><tspan class="math-main">))</tspan></text>
<line x1="65" y1="225" x2="335" y2="225" stroke="var(--sub-color, #64748b)" stroke-width="1.4" marker-end="url(#arr-sub)" />
<line x1="85" y1="240" x2="85" y2="85" stroke="var(--sub-color, #64748b)" stroke-width="1.4" marker-end="url(#arr-sub)" />
<line x1="205" y1="95" x2="205" y2="225" stroke="var(--border-color, #cbd5e1)" stroke-width="1.2" stroke-dasharray="3,3" />
<path d="M 105 205 L 305 115" fill="none" stroke="var(--primary-color, #2563eb)" stroke-width="2.4" />
<circle cx="205" cy="160" r="5.5" fill="var(--paper-bg, #ffffff)" stroke="var(--primary-color, #2563eb)" stroke-width="2.2" />
<circle cx="205" cy="105" r="5" fill="var(--title-color, #0f172a)" />
<text x="195" y="164" text-anchor="end" font-size="11.5" fill="var(--primary-color, #2563eb)" class="math-sym">L<tspan class="desc-txt" font-size="10.5"> (극한값)</tspan></text>
<text x="216" y="109" text-anchor="start" font-size="11.5" fill="var(--title-color, #0f172a)" class="math-sym">f<tspan class="math-main">(</tspan>a<tspan class="math-main">)</tspan><tspan class="desc-txt" font-size="10.5"> (함숫값)</tspan></text>
<text x="205" y="242" text-anchor="middle" font-size="11.5" fill="var(--title-color, #0f172a)" class="math-sym">a</text>
<text x="200" y="262" text-anchor="middle" font-size="11" fill="var(--text-color, #334155)" class="desc-txt">양방향 극한은 <tspan class="math-sym">L</tspan> 로 일치하나 <tspan class="math-sym">f</tspan><tspan class="math-main">(</tspan><tspan class="math-sym">a</tspan><tspan class="math-main">) = </tspan><tspan class="math-sym">L</tspan> 일 때만 연속</text>
<rect x="390" y="52" width="340" height="222" rx="8" fill="var(--paper-bg, #ffffff)" stroke="var(--border-color, #94a3b8)" stroke-width="1.4" />
<text x="560" y="74" text-anchor="middle" font-size="12" fill="var(--title-color, #0f172a)" class="desc-txt">2) 좌극한과 우극한이 달라 극한이 존재하지 않는 경우</text>
<line x1="425" y1="225" x2="695" y2="225" stroke="var(--sub-color, #64748b)" stroke-width="1.4" marker-end="url(#arr-sub)" />
<line x1="560" y1="240" x2="560" y2="85" stroke="var(--sub-color, #64748b)" stroke-width="1.4" marker-end="url(#arr-sub)" />
<line x1="445" y1="185" x2="560" y2="185" stroke="var(--text-color, #334155)" stroke-width="2.5" />
<line x1="560" y1="120" x2="675" y2="120" stroke="var(--primary-color, #2563eb)" stroke-width="2.5" />
<circle cx="560" cy="185" r="5" fill="var(--paper-bg, #ffffff)" stroke="var(--text-color, #334155)" stroke-width="2.2" />
<circle cx="560" cy="120" r="5" fill="var(--primary-color, #2563eb)" />
<text x="495" y="173" text-anchor="middle" font-size="11.5" fill="var(--text-color, #334155)" class="desc-txt">좌극한 <tspan class="math-sym">L</tspan><tspan dy="3" font-size="8.5" class="math-main">−</tspan></text>
<text x="625" y="108" text-anchor="middle" font-size="11.5" fill="var(--primary-color, #2563eb)" class="desc-txt">우극한 <tspan class="math-sym">L</tspan><tspan dy="3" font-size="8.5" class="math-main">+</tspan></text>
<text x="560" y="242" text-anchor="middle" font-size="11.5" fill="var(--title-color, #0f172a)" class="math-sym">a</text>
<text x="560" y="262" text-anchor="middle" font-size="11" fill="var(--text-color, #334155)" class="desc-txt"><tspan class="math-sym">L</tspan><tspan dy="3" font-size="8.5" class="math-main">−</tspan><tspan dy="-3" class="math-main"> ≠ </tspan><tspan class="math-sym">L</tspan><tspan dy="3" font-size="8.5" class="math-main">+</tspan><tspan dy="-3"> 이므로 양방향을 아우르는 극한값 없음</tspan></text>
</svg>
</div>

## 7. 오늘의 내용을 정리해 보자

오늘 우리는 수열에서 확립한 극한의 논리를 함수라는 새로운 무대로 확장했습니다.

첫째, 함수의 극한은 기준점에서의 실제 함숫값과 본질적으로 구별됩니다. $f(a)$ 가 정의되어 있지 않아도 극한은 온전히 존재할 수 있으며, 함숫값이 정의되어 있더라도 극한값과 다를 수 있습니다.

둘째, 함수의 극한을 엄밀하게 정의하기 위해 입력값의 오차($|x - a|$)와 함숫값의 오차($|f(x) - L|$)를 명확히 분리했습니다. $\varepsilon$ 은 함숫값에 허용되는 오차이며, $\delta$ 는 그 오차를 보장하기 위해 입력값을 제한해야 하는 허용 반경입니다.

셋째, $\varepsilon$-$\delta$ 정의를 이용하여 일차함수와 제곱함수의 극한을 직접 증명했습니다. 특히 다항함수의 증명에서는 보조 반경을 먼저 두어 잉여 인수를 상수로 통제한 후 최종 $\delta$ 를 선택하는 핵심 전략을 익혔습니다.

넷째, 함수의 극한값 역시 수열과 마찬가지로 오직 하나뿐임을 삼각부등식을 통해 증명했으며, 극한의 기본 사칙연산 법칙들을 확립했습니다.

마지막으로 극한과 함숫값이 완전히 합치될 때 비로소 **연속** 이라는 강력한 성질이 성립함을 정의했습니다.

이제 우리는 더 넓은 질문을 마주하게 됩니다.

**함수의 극한이 존재한다는 사실을 어떻게 더욱 일반적인 틀에서 판정할 수 있을까요? 그리고 연속이라는 성질은 미적분학의 거대한 정리를 쌓아 올리는 데 어떤 강력한 힘을 발휘할까요?**

다음 시간에는 연속함수가 닫힌구간 위에서 발휘하는 강력한 성질들(최대·최소 정리, 사잇값 정리 등)을 탐구하며, 극한과 연속의 개념이 어떻게 해석학의 핵심 정리들로 피어나는지 살펴보겠습니다.
