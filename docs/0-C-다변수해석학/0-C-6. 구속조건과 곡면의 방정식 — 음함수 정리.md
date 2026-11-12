# 0-C-6. 구속조건과 곡면의 방정식 — 음함수 정리

## 1. 얽혀 있는 변수들을 어떻게 풀어낼 것인가?

우리는 0-C-5에서 야코비 행렬식이 $0$ 이 아닐 때 비선형 사상을 국소적으로 완벽히 되돌릴 수 있다는 **역함수 정리** 를 세웠습니다.

하지만 자연과학과 공학, 그리고 기하학의 실제 문제들은 종종 $y = f(x)$ 처럼 한 변수가 다른 변수에 대해 친절하게 정리된 형태로 주어지지 않습니다.

대부분의 경우 여러 변수들이 거대한 등식의 그물망 속에 단단히 얽혀 있는 **구속조건(Constraint)** 의 형태로 나타납니다:

$$ F(x_1, \ldots, x_n, y) = 0 $$

예를 들어 3차원 공간에서 구면의 방정식은 다음과 같습니다:

$$ x^2 + y^2 + z^2 - 1 = 0 $$

이 방정식 속에서 우리는 다음과 같은 지극히 실제적인 질문을 던지게 됩니다:

**"어떤 점 주변에서, 우리는 과연 종속변수 $y$ 를 나머지 독립변수들의 매끄러운 함수 $y = g(x_1, \ldots, x_n)$ 로 국소적으로 유일하게 풀어낼 수 있을까요?"**

더 나아가, **"손으로 직접 식을 풀지 못하더라도, 그 숨겨진 함수 $g$ 의 미분계수를 원래 관계식 $F$ 로부터 직접 계산해 낼 수 있을까요?"**

이 물음에 대한 가장 완벽한 해답이 바로 역함수 정리와 논리적으로 동치인 **음함수 정리(Implicit Function Theorem)** 입니다.

## 2. 단위원의 기하학: 언제 함수로 풀리지 않는가?

본격적인 일반화에 들어가기 앞서, 가장 친숙한 2차원 단위원을 통해 기하학적 직관을 세워 봅시다:

$$ F(x, y) = x^2 + y^2 - 1 = 0 $$

이 관계식에서 $y$ 를 $x$ 의 함수로 풀어내고 싶습니다.

우리는 고등학교 때부터 잘 알고 있습니다:
* 북반구 ($y > 0$): $y = \sqrt{1 - x^2}$
* 남반구 ($y < 0$): $y = -\sqrt{1 - x^2}$

북극 $(0, 1)$ 이나 남극 $(0, -1)$ 근방에서는 아무런 문제 없이 $y$ 가 $x$ 에 대한 매끄러운 함수로 잘 풀립니다.

그런데 양쪽 끝점인 **동극 $(1, 0)$** 과 **서극 $(-1, 0)$** 에서는 어떤 일이 벌어집니까?

점 $(1, 0)$ 주변에서는 $x$ 값 하나에 위아래 두 개의 $y$ 값이 대응하므로, $y$ 를 $x$ 의 일가함수(Single-valued function)로 유일하게 정의할 수 없습니다! 접선이 완전히 수직으로 곤두서기 때문입니다.

동극 $(1, 0)$ 과 북극 $(0, 1)$ 의 결정적인 수학적 차이는 무엇일까요?

관계식 $F(x, y) = x^2 + y^2 - 1$ 의 편도함수를 구해 보십시오:

$$ \frac{\partial F}{\partial x} = 2x, \qquad \frac{\partial F}{\partial y} = 2y $$

* 북극 $(0, 1)$ 에서: 풀고자 하는 변수 $y$ 에 대한 편미분은 $\frac{\partial F}{\partial y} = 2 \ne 0$ 입니다! $\implies$ **함수로 잘 풀림!**
* 동극 $(1, 0)$ 에서: 풀고자 하는 변수 $y$ 에 대한 편미분이 $\frac{\partial F}{\partial y} = 0$ 입니다! $\implies$ **수직 접선 발생, 함수로 풀리지 않음!**

이 단순한 관찰 속에 음함수 정리의 모든 비밀이 들어 있습니다:

**"구속조건 $F(x, y) = 0$ 에서 특정 변수 $y$ 를 함수로 풀어낼 수 있는 열쇠는, 다름 아닌 그 변수에 대한 편도함수 $\frac{\partial F}{\partial y}$ 가 $0$ 이 아니어야 한다는 조건이다!"**



<div class="card" style="margin: 2em 0; padding: 18px 12px; text-align: center; overflow-x: auto;">
<svg viewBox="0 0 760 310" width="100%" height="auto" xmlns="http://www.w3.org/2000/svg">
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
<rect x="8" y="8" width="744" height="294" rx="12" fill="var(--card-bg, #f8fafc)" stroke="var(--border-color, #cbd5e1)" stroke-width="1.2" />
<text x="380" y="32" text-anchor="middle" font-size="14" fill="var(--title-color, #0f172a)" class="desc-txt">[도식 1] 단위원 <tspan class="math-sym">F</tspan><tspan class="math-main">(</tspan><tspan class="math-sym">x, y</tspan><tspan class="math-main">) = </tspan><tspan class="math-sym">x</tspan><tspan dy="-5" font-size="9" class="math-main">2</tspan><tspan dy="5" class="math-main"> + </tspan><tspan class="math-sym">y</tspan><tspan dy="-5" font-size="9" class="math-main">2</tspan><tspan dy="5" class="math-main"> − 1 = 0</tspan> 에서 음함수 정리의 작동 조건(<tspan class="math-main">∂</tspan><tspan class="math-sym">F</tspan><tspan class="math-main">/∂</tspan><tspan class="math-sym">y</tspan><tspan class="math-main"> ≠ 0</tspan>)</text>
<rect x="35" y="52" width="335" height="236" rx="8" fill="var(--paper-bg, #ffffff)" stroke="var(--border-color, #94a3b8)" stroke-width="1.4" />
<line x1="70" y1="175" x2="335" y2="175" stroke="var(--sub-color, #64748b)" stroke-width="1.3" marker-end="url(#arr-sub)" />
<line x1="202" y1="262" x2="202" y2="85" stroke="var(--sub-color, #64748b)" stroke-width="1.3" marker-end="url(#arr-sub)" />
<circle cx="202" cy="175" r="68" fill="none" stroke="var(--text-color, #334155)" stroke-width="2" />
<path d="M 162 120 A 68 68 0 0 1 242 120" fill="none" stroke="var(--primary-color, #2563eb)" stroke-width="3.6" />
<rect x="160" y="96" width="84" height="28" rx="4" fill="none" stroke="var(--primary-color, #2563eb)" stroke-width="1.4" stroke-dasharray="4,2" />
<line x1="270" y1="130" x2="270" y2="220" stroke="var(--sub-color, #64748b)" stroke-width="1.8" stroke-dasharray="3,2" />
<circle cx="202" cy="107" r="5" fill="var(--primary-color, #2563eb)" />
<circle cx="270" cy="175" r="5" fill="var(--title-color, #0f172a)" />
<text x="202" y="90" text-anchor="middle" font-size="11.5" fill="var(--primary-color, #2563eb)" class="desc-txt">북극 (0, 1): <tspan class="math-main">∂</tspan><tspan class="math-sym">F</tspan><tspan class="math-main">/∂</tspan><tspan class="math-sym">y</tspan><tspan class="math-main"> = 2 ≠ 0</tspan></text>
<text x="278" y="164" text-anchor="start" font-size="11" fill="var(--title-color, #0f172a)" class="desc-txt">동극 (1, 0)</text>
<text x="278" y="194" text-anchor="start" font-size="11" fill="var(--sub-color, #64748b)" class="math-main">∂<tspan class="math-sym">F</tspan>/∂<tspan class="math-sym">y</tspan> = 0</text>
<text x="202" y="276" text-anchor="middle" font-size="11" fill="var(--text-color, #334155)" class="desc-txt">단위원 경계선(<tspan class="math-sym">F</tspan><tspan class="math-main">=0</tspan>)과 좌표축</text>
<rect x="395" y="52" width="330" height="236" rx="8" fill="var(--paper-bg, #ffffff)" stroke="var(--primary-color, #2563eb)" stroke-width="1.5" />
<text x="560" y="78" text-anchor="middle" font-size="12.5" fill="var(--primary-color, #2563eb)" class="desc-txt">국소 음함수 사상 <tspan class="math-sym">g</tspan><tspan class="math-main"> : </tspan><tspan class="math-sym">U</tspan><tspan dy="3" font-size="8" class="math-main">0</tspan><tspan dy="-3" class="math-main"> → </tspan><tspan class="math-sym">V</tspan><tspan dy="3" font-size="8" class="math-main">0</tspan></text>
<rect x="420" y="96" width="115" height="62" rx="6" fill="var(--card-bg, #f8fafc)" stroke="var(--border-color, #94a3b8)" stroke-width="1.3" />
<text x="477" y="118" text-anchor="middle" font-size="11" fill="var(--title-color, #0f172a)" class="desc-txt">[정의역] 독립변수</text>
<text x="477" y="142" text-anchor="middle" font-size="12" fill="var(--primary-color, #2563eb)" class="math-sym">x<tspan class="math-main"> ∈ </tspan>U<tspan dy="3" font-size="8" class="math-main">0</tspan></text>
<rect x="585" y="96" width="115" height="62" rx="6" fill="var(--card-bg, #eff6ff)" stroke="var(--primary-color, #2563eb)" stroke-width="1.4" />
<text x="642" y="118" text-anchor="middle" font-size="11" fill="var(--primary-color, #2563eb)" class="desc-txt">[공역] 종속변수</text>
<text x="642" y="142" text-anchor="middle" font-size="12" fill="var(--title-color, #0f172a)" class="math-sym">y<tspan class="math-main"> = </tspan>g<tspan class="math-main">(</tspan>x<tspan class="math-main">) ∈ </tspan>V<tspan dy="3" font-size="8" class="math-main">0</tspan></text>
<line x1="540" y1="127" x2="579" y2="127" stroke="var(--primary-color, #2563eb)" stroke-width="2.2" marker-end="url(#arr-primary)" />
<text x="560" y="118" text-anchor="middle" font-size="12" fill="var(--primary-color, #2563eb)" class="math-sym">g</text>
<text x="560" y="190" text-anchor="middle" font-size="12" fill="var(--title-color, #0f172a)" class="math-sym">Dg<tspan class="math-main">(</tspan>x<tspan class="math-main">) = − [</tspan>D<tspan dy="3" font-size="8">y</tspan><tspan dy="-3">F</tspan><tspan class="math-main">]</tspan><tspan dy="-4" font-size="8" class="math-main">−1</tspan><tspan dy="4"> · </tspan>D<tspan dy="3" font-size="8">x</tspan><tspan dy="-3">F</tspan></text>
<text x="560" y="222" text-anchor="middle" font-size="11" fill="var(--text-color, #334155)" class="desc-txt">• <tspan class="math-main">det(</tspan><tspan class="math-sym">D</tspan><tspan dy="3" font-size="7.5" class="math-sym">y</tspan><tspan dy="-3" class="math-sym">F</tspan><tspan class="math-main">) ≠ 0</tspan> 이면 국소적으로 유일한 <tspan class="math-sym">y = g</tspan><tspan class="math-main">(</tspan><tspan class="math-sym">x</tspan><tspan class="math-main">)</tspan> 존재</text>
<text x="560" y="246" text-anchor="middle" font-size="11" fill="var(--sub-color, #64748b)" class="desc-txt">• 동극 (1, 0) 에서는 수직 접선이 생겨 <tspan class="math-sym">y</tspan> 에 대해 풀리지 않음</text>
</svg>
</div>

## 3. 구속조건의 국소 해법: 음함수 정리

이제 이 직관을 다차원 공간 전체로 일반화해 봅시다.

독립변수 벡터 $\mathbf{x} = (x_1, \ldots, x_n) \in \mathbb{R}^n$ 과 풀어내고자 하는 종속변수 벡터 $\mathbf{y} = (y_1, \ldots, y_m) \in \mathbb{R}^m$ 이 $m$ 개의 연립 구속조건 방정식 속에 얽혀 있는 상황입니다:

$$ F(\mathbf{x}, \mathbf{y}) = \mathbf{0}, \qquad F: \mathbb{R}^n \times \mathbb{R}^m \to \mathbb{R}^m $$

### [정리] 음함수 정리 (Implicit Function Theorem)

열린집합 $U \subset \mathbb{R}^n \times \mathbb{R}^m$ 에서 정의된 $C^1$ 급 사상 $F: U \to \mathbb{R}^m$ 과 점 $(\mathbf{a}, \mathbf{b}) \in U$ 에 대하여 다음 두 조건이 성립한다고 하자:

1. $(\mathbf{a}, \mathbf{b})$ 는 구속조건의 해이다:
$$ F(\mathbf{a}, \mathbf{b}) = \mathbf{0} $$
2. 종속변수 $\mathbf{y}$ 에 대한 $m \times m$ 부분 야코비 행렬이 가역이다:
$$ \det \left( D_{\mathbf{y}} F(\mathbf{a}, \mathbf{b}) \right) = \det \left( \frac{\partial F_i}{\partial y_k}(\mathbf{a}, \mathbf{b}) \right)_{1 \le i, k \le m} \ne 0 $$

그러면 다음 결론이 성립한다:

1. **음함수의 국소적 유일 존재:** 점 $\mathbf{a}$ 를 포함하는 열린 근방 $U_0 \subset \mathbb{R}^n$ 와 점 $\mathbf{b}$ 를 포함하는 열린 근방 $V_0 \subset \mathbb{R}^m$ 가 존재하여, 각 $\mathbf{x} \in U_0$ 마다
$$ F(\mathbf{x}, \mathbf{y}) = \mathbf{0} $$
을 만족하는 $V_0$ 안의 점 $\mathbf{y}$ 는 오직 하나뿐이다. 이 대응을 $\mathbf{y} = g(\mathbf{x})$ 라 두면,
$$ F(\mathbf{x}, g(\mathbf{x})) = \mathbf{0}, \qquad g(\mathbf{a}) = \mathbf{b} $$
가 성립한다.
2. **음함수의 매끄러움:** 사상 $g: U_0 \to V_0$ 는 $C^1$ 급 사상이다.
3. **음함수의 미분 공식:** 음함수 $g$ 의 전미분은 다음의 우아한 행렬식으로 계산된다:
$$ Dg(\mathbf{x}) = - \left[ D_{\mathbf{y}} F(\mathbf{x}, g(\mathbf{x})) \right]^{-1} \cdot D_{\mathbf{x}} F(\mathbf{x}, g(\mathbf{x})) $$

**증명**

이 정리의 진정한 우아함은, 0-C-5의 **역함수 정리** 를 단 한 번 적용함으로써 증명이 완전히 끝난다는 데 있습니다.

$\mathbb{R}^{n+m}$ 에서 $\mathbb{R}^{n+m}$ 으로 가는 다음과 같은 기발한 확장 사상 $\Phi$ 를 정의합니다:

$$ \Phi(\mathbf{x}, \mathbf{y}) = (\mathbf{x}, F(\mathbf{x}, \mathbf{y})) $$

이 사상의 야코비 행렬을 블록 행렬(0-A-4)로 써보면:

$$ J_\Phi(\mathbf{a}, \mathbf{b}) = \begin{pmatrix} I_n & O \\ D_{\mathbf{x}} F(\mathbf{a}, \mathbf{b}) & D_{\mathbf{y}} F(\mathbf{a}, \mathbf{b}) \end{pmatrix} $$

하삼각 블록 행렬의 행렬식은 대각 블록들의 행렬식의 곱이므로:

$$ \det J_\Phi(\mathbf{a}, \mathbf{b}) = \det(I_n) \cdot \det(D_{\mathbf{y}} F(\mathbf{a}, \mathbf{b})) = \det(D_{\mathbf{y}} F(\mathbf{a}, \mathbf{b})) $$

가정에 의해 $\det(D_{\mathbf{y}} F(\mathbf{a}, \mathbf{b})) \ne 0$ 이므로,

$$ \det J_\Phi(\mathbf{a}, \mathbf{b}) \ne 0 $$

입니다!

따라서 0-C-5의 **역함수 정리** 에 의해, 사상 $\Phi$ 는 점 $(\mathbf{a}, \mathbf{b})$ 근방에서 국소 미분동형사상이며, 매끄러운 역함수 $\Psi = \Phi^{-1}$ 가 존재합니다:

$$ \Psi(\mathbf{x}, \mathbf{w}) = (\mathbf{x}, H(\mathbf{x}, \mathbf{w})) $$

이제 우리가 찾고자 하는 구속조건은 $F(\mathbf{x}, \mathbf{y}) = \mathbf{0}$, 즉 $\mathbf{w} = \mathbf{0}$ 인 특수한 경우입니다!

따라서 $g(\mathbf{x}) = H(\mathbf{x}, \mathbf{0})$ 로 정의하면:

$$ \Phi(\mathbf{x}, g(\mathbf{x})) = \Phi(\Psi(\mathbf{x}, \mathbf{0})) = (\mathbf{x}, \mathbf{0}) $$

사상 $\Phi$ 의 정의에 의해 이는 곧 $F(\mathbf{x}, g(\mathbf{x})) = \mathbf{0}$ 임을 뜻합니다. 역함수가 $C^1$ 급이므로 $g$ 역시 $C^1$ 급입니다!

마지막으로 미분 공식은, 항등식 $F(\mathbf{x}, g(\mathbf{x})) = \mathbf{0}$ 의 양변에 0-C-3의 다변수 연쇄법칙을 적용하면:

$$ D_{\mathbf{x}} F(\mathbf{x}, g(\mathbf{x})) + D_{\mathbf{y}} F(\mathbf{x}, g(\mathbf{x})) \cdot Dg(\mathbf{x}) = O $$

가역인 $D_{\mathbf{y}} F$ 의 역행렬을 좌측에 곱해주면:

$$ Dg(\mathbf{x}) = - \left[ D_{\mathbf{y}} F \right]^{-1} D_{\mathbf{x}} F $$

를 즉시 얻습니다.

증명이 끝났습니다.

0-C-5의 역함수 정리와 0-C-6의 음함수 정리가 사실은 하나의 뿌리에서 나온 동전의 양면이었음이 완벽하게 드러났습니다.

## 4. 제약조건이 있는 최적화: 라그랑주 승수법

음함수 정리의 가장 눈부신 응용은 물리학과 최적화 이론의 핵심 무기인 **라그랑주 승수법(Lagrange Multipliers)** 입니다.

구속조건 곡면 $g(\mathbf{x}) = 0$ 에 갇혀 있는 입자가 어떤 물리적 퍼텐셜 $f(\mathbf{x})$ 의 최댓값이나 최솟값을 찾는 문제를 생각해 보십시오.

### 4.1 기하학적 직관: 등위면의 접촉

곡면 $g(\mathbf{x}) = 0$ 위를 움직일 때 $f(\mathbf{x})$ 가 극값을 달성하는 점 $\mathbf{x}_0$ 에서는 어떤 일이 벌어질까요?

$f(\mathbf{x}) = c$ 의 등위면(Level surface)과 구속조건 곡면 $g(\mathbf{x}) = 0$ 을 겹쳐 보십시오.

만약 두 곡면이 비스듬하게 교차한다면, 우리는 교차선을 따라 움직임으로써 $f$ 의 값을 더 크게 만들 수도 있고 더 작게 만들 수도 있습니다. 따라서 그 점은 결코 극값이 될 수 없습니다!

극값을 달성하는 유일한 순간은, **"목적함수의 등위면과 구속조건 곡면이 단 한 점에서 스치듯 서로 접할 때(Tangent)"** 뿐입니다!

두 곡면이 서로 접한다는 것은, 두 곡면에 수직인 법선벡터(Normal Vector)들이 서로 평행해야 함을 뜻합니다.

그런데 곡면의 법선벡터는 다름 아닌 **그래디언트(Gradient)** 입니다!

따라서 두 그래디언트 벡터가 나란해야 합니다:

$$ \nabla f(\mathbf{x}_0) = \lambda \nabla g(\mathbf{x}_0) $$

여기서 비례상수 $\lambda \in \mathbb{R}$ 를 **라그랑주 승수(Lagrange Multiplier)** 라고 부릅니다.

### [정리] 라그랑주 승수법 (Lagrange Multipliers)

열린집합 $U \subset \mathbb{R}^n$ 에서 정의된 $C^1$ 급 함수 $f, g: U \to \mathbb{R}$ 에 대하여, 구속조건 $S = \{ \mathbf{x} \in U : g(\mathbf{x}) = 0 \}$ 위에서 $f$ 가 점 $\mathbf{x}_0 \in S$ 에서 극값을 갖는다고 하자.

만약 $\nabla g(\mathbf{x}_0) \ne \mathbf{0}$ 이면, 적절한 실수 $\lambda \in \mathbb{R}$ 가 존재하여 다음이 성립한다:

$$ \nabla f(\mathbf{x}_0) = \lambda \nabla g(\mathbf{x}_0) $$

**증명 (음함수 정리를 이용한 엄밀한 유도)**

$\nabla g(\mathbf{x}_0) \ne \mathbf{0}$ 이므로, 편도함수들 중 적어도 하나는 $0$ 이 아닙니다. 일반성을 잃지 않고 마지막 변수 $x_n$ 에 대한 편도함수가 $\frac{\partial g}{\partial x_n}(\mathbf{x}_0) \ne 0$ 이라고 합시다.

점이 $\mathbf{x}_0 = (\mathbf{a}, b) \in \mathbb{R}^{n-1} \times \mathbb{R}$ 이고 $g(\mathbf{a}, b) = 0$ 이며 $\frac{\partial g}{\partial x_n}(\mathbf{a}, b) \ne 0$ 이므로, 3절의 **음함수 정리** 에 의해 $\mathbf{a}$ 의 열린 근방 $U_0 \subset \mathbb{R}^{n-1}$ 에서 정의된 $C^1$ 급 함수 $h : U_0 \to \mathbb{R}$ 가 존재하여
$$
h(\mathbf{a}) = b, \qquad g(x_1, \ldots, x_{n-1}, h(x_1, \ldots, x_{n-1})) = 0 \quad (\forall (x_1, \ldots, x_{n-1}) \in U_0)
$$
을 만족합니다. 그리고 음함수의 미분 공식에 의해 각 $j = 1, \ldots, n-1$ 에 대하여
$$
\frac{\partial h}{\partial x_j}(\mathbf{a}) = - \frac{\frac{\partial g}{\partial x_j}(\mathbf{x}_0)}{\frac{\partial g}{\partial x_n}(\mathbf{x}_0)}
$$
입니다.

한편 $f$ 는 구속집합 $S$ 위에서 점 $\mathbf{x}_0$ 에서 극값을 가지므로, 합성함수 $\phi(x_1, \ldots, x_{n-1}) = f(x_1, \ldots, x_{n-1}, h(x_1, \ldots, x_{n-1}))$ 는 열린집합 $U_0$ 의 내부점 $\mathbf{a}$ 에서 제약 없는 극값을 가집니다. 따라서 0-B-7의 페르마 정리와 0-C-3의 다변수 연쇄법칙에 의해, 모든 $j = 1, \ldots, n-1$ 에 대하여
$$
0 = \frac{\partial \phi}{\partial x_j}(\mathbf{a}) = \frac{\partial f}{\partial x_j}(\mathbf{x}_0) + \frac{\partial f}{\partial x_n}(\mathbf{x}_0) \frac{\partial h}{\partial x_j}(\mathbf{a})
$$
가 성립합니다. 이제 실수 상수 $\lambda$ 를
$$
\lambda = \frac{\frac{\partial f}{\partial x_n}(\mathbf{x}_0)}{\frac{\partial g}{\partial x_n}(\mathbf{x}_0)}
$$
로 정의하면, 마지막 성분($j = n$)에서는 정의에 의해 $\frac{\partial f}{\partial x_n}(\mathbf{x}_0) = \lambda \frac{\partial g}{\partial x_n}(\mathbf{x}_0)$ 이 성립하고, 나머지 성분($j = 1, \ldots, n-1$)에서도 위 음함수 미분식을 대입하면
$$
\frac{\partial f}{\partial x_j}(\mathbf{x}_0) = - \frac{\partial f}{\partial x_n}(\mathbf{x}_0) \frac{\partial h}{\partial x_j}(\mathbf{a}) = \lambda \frac{\partial g}{\partial x_j}(\mathbf{x}_0)
$$
가 성립합니다. 따라서 벡터 등식 $\nabla f(\mathbf{x}_0) = \lambda \nabla g(\mathbf{x}_0)$ 가 증명되었습니다. 증명이 끝났습니다.

<div class="card" style="margin: 2em 0; padding: 18px 12px; text-align: center; overflow-x: auto;">
<svg viewBox="0 0 760 295" width="100%" height="auto" xmlns="http://www.w3.org/2000/svg">
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
<rect x="8" y="8" width="744" height="279" rx="12" fill="var(--card-bg, #f8fafc)" stroke="var(--border-color, #cbd5e1)" stroke-width="1.2" />
<text x="380" y="32" text-anchor="middle" font-size="14" fill="var(--title-color, #0f172a)" class="desc-txt">[도식 2] 라그랑주 승수법(<tspan class="math-main">∇</tspan><tspan class="math-sym">f</tspan><tspan class="math-main"> = </tspan><tspan class="math-sym">λ</tspan><tspan class="math-main">∇</tspan><tspan class="math-sym">g</tspan>)의 기하학: 구속조건 곡면과 목적함수 등위면의 접촉</text>
<rect x="35" y="52" width="340" height="220" rx="8" fill="var(--paper-bg, #ffffff)" stroke="var(--border-color, #94a3b8)" stroke-width="1.4" />
<line x1="65" y1="238" x2="345" y2="238" stroke="var(--sub-color, #64748b)" stroke-width="1.3" marker-end="url(#arr-sub)" />
<line x1="85" y1="252" x2="85" y2="75" stroke="var(--sub-color, #64748b)" stroke-width="1.3" marker-end="url(#arr-sub)" />
<path d="M 105 220 Q 185 110 315 190" fill="none" stroke="var(--title-color, #0f172a)" stroke-width="2.5" />
<ellipse cx="215" cy="115" rx="68" ry="42" fill="none" stroke="var(--primary-color, #2563eb)" stroke-width="1.8" stroke-dasharray="5,3" />
<ellipse cx="215" cy="115" rx="42" ry="26" fill="none" stroke="var(--border-color, #94a3b8)" stroke-width="1.3" stroke-dasharray="3,3" />
<line x1="152" y1="168" x2="245" y2="144" stroke="var(--sub-color, #64748b)" stroke-width="1.5" stroke-dasharray="3,2" />
<line x1="198" y1="156" x2="214" y2="95" stroke="var(--primary-color, #2563eb)" stroke-width="2.6" marker-end="url(#arr-primary)" />
<line x1="198" y1="156" x2="186" y2="202" stroke="var(--text-color, #334155)" stroke-width="2.4" marker-end="url(#arr-text)" />
<circle cx="198" cy="156" r="5" fill="var(--title-color, #0f172a)" />
<text x="224" y="102" font-size="12" fill="var(--primary-color, #2563eb)" class="math-main">∇<tspan class="math-sym">f</tspan>(<tspan class="math-sym">x</tspan><tspan dy="3" font-size="8" class="math-main">0</tspan><tspan dy="-3">)</tspan></text>
<text x="196" y="212" font-size="12" fill="var(--text-color, #334155)" class="math-main">∇<tspan class="math-sym">g</tspan>(<tspan class="math-sym">x</tspan><tspan dy="3" font-size="8" class="math-main">0</tspan><tspan dy="-3">)</tspan></text>
<text x="310" y="206" text-anchor="end" font-size="11.5" fill="var(--title-color, #0f172a)" class="math-sym">g<tspan class="math-main">(</tspan>x<tspan class="math-main">) = 0</tspan></text>
<text x="305" y="112" text-anchor="start" font-size="11.5" fill="var(--primary-color, #2563eb)" class="math-sym">f<tspan class="math-main">(</tspan>x<tspan class="math-main">) = </tspan>c</text>
<rect x="395" y="52" width="330" height="220" rx="8" fill="var(--paper-bg, #ffffff)" stroke="var(--primary-color, #2563eb)" stroke-width="1.5" />
<text x="560" y="80" text-anchor="middle" font-size="12.5" fill="var(--title-color, #0f172a)" class="desc-txt">접평면 공유와 법선벡터 평행 조건</text>
<line x1="415" y1="94" x2="705" y2="94" stroke="var(--border-color, #cbd5e1)" stroke-width="1" />
<text x="560" y="126" text-anchor="middle" font-size="11.5" fill="var(--text-color, #334155)" class="desc-txt">구속곡면 <tspan class="math-sym">g</tspan><tspan class="math-main"> = 0</tspan> 의 임의의 접벡터 <tspan class="math-sym">v</tspan> (<tspan class="math-main">∇</tspan><tspan class="math-sym">g</tspan><tspan class="math-main"> · </tspan><tspan class="math-sym">v</tspan><tspan class="math-main"> = 0</tspan>)에 대해</text>
<text x="560" y="152" text-anchor="middle" font-size="11.5" fill="var(--text-color, #334155)" class="desc-txt">극값점 <tspan class="math-sym">x</tspan><tspan dy="3" font-size="8" class="math-main">0</tspan><tspan dy="-3"> 에서는 방향도함수 </tspan><tspan class="math-main">∇</tspan><tspan class="math-sym">f</tspan><tspan class="math-main"> · </tspan><tspan class="math-sym">v</tspan><tspan class="math-main"> = 0</tspan> 이어야 함</text>
<text x="560" y="190" text-anchor="middle" font-size="13" fill="var(--primary-color, #2563eb)" class="math-main">⇒ ∇<tspan class="math-sym">f</tspan>(<tspan class="math-sym">x</tspan><tspan dy="3" font-size="8.5">0</tspan><tspan dy="-3">) = </tspan><tspan class="math-sym">λ</tspan> ∇<tspan class="math-sym">g</tspan>(<tspan class="math-sym">x</tspan><tspan dy="3" font-size="8.5">0</tspan><tspan dy="-3">)</tspan></text>
<text x="560" y="232" text-anchor="middle" font-size="11" fill="var(--sub-color, #64748b)" class="desc-txt">• 정칙값 정리: <tspan class="math-main">∇</tspan><tspan class="math-sym">g</tspan><tspan class="math-main"> ≠ 0</tspan> 이면 <tspan class="math-sym">g</tspan><tspan class="math-main"> = 0</tspan> 은 매끄러운 부분다양체</text>
</svg>
</div>



## 5. 2단계 다양체로의 연결: 정칙값 정리

음함수 정리는 기하학에서 매끄러운 곡면(부분다양체 Submanifold)을 구성하는 가장 핵심적인 기계입니다.

방정식 $F(\mathbf{x}) = \mathbf{0}$ 을 만족하는 점들의 모임이 찌그러지거나 뾰족한 모서리 없이 매끄러운 곡면이 되려면 어떤 조건이 필요할까요?

음함수 정리가 답을 줍니다: **모든 점에서 그래디언트 벡터들이 선형독립(Full rank)이어야 한다!**

이를 기하학에서는 **정칙값 정리(Regular Value Theorem)** 라고 부릅니다:

"점 $\mathbf{c}$ 가 사상 $F: \mathbb{R}^{n+m} \to \mathbb{R}^m$ 의 정칙값이면, 등위집합 $S = F^{-1}(\mathbf{c})$ 는 예외 없이 완벽하게 매끄러운 $n$ 차원 다양체(Submanifold)가 된다!"

구면, 원기둥, 토러스, 그리고 아인슈타인 방정식의 해로 등장하는 매끄러운 시공간 곡면들이 모두 이 이 음함수 정리와 정칙값 정리 위에서 엄밀하게 정의됩니다.

## 6. 오늘 확립한 구조와 다음 장으로의 질문

오늘 우리는 구속조건의 사슬에 얽혀 있던 다차원 변수들을 완벽하게 해방시켰습니다:

1. **음함수 정리의 확립:** 풀고자 하는 변수의 부분 야코비 행렬식이 $0$ 이 아닐 때, 복잡한 구속조건 $F(\mathbf{x}, \mathbf{y}) = \mathbf{0}$ 속에서 매끄러운 음함수 $\mathbf{y} = g(\mathbf{x})$ 가 유일하게 존재함을 증명했습니다.
2. **역함수 정리와의 대등성:** 확장 사상 $\Phi(\mathbf{x}, \mathbf{y}) = (\mathbf{x}, F(\mathbf{x}, \mathbf{y}))$ 를 통해 역함수 정리로부터 음함수 정리를 유도하는 환상적인 대수적 연결고리를 완성했습니다.
3. **라그랑주 승수법:** 등위면들의 기하학적 접촉 조건을 통해, 구속조건 아래에서의 극값 판정 공식 $\nabla f = \lambda \nabla g$ 를 정립했습니다.
4. **부분다양체의 씨앗:** 음함수 정리가 매끄러운 곡면과 시공간을 정의하는 '정칙값 정리'의 모태가 됨을 확인했습니다.

이로써 우리는 다변수 함수의 '미분'에 관한 모든 국소적 구조(선형근사, 야코비 행렬, 헤시안 행렬, 역함수, 음함수, 제약조건)를 빈틈없이 완성했습니다.

이제 다변수 해석학의 마지막 장대한 능선이 우리를 기다리고 있습니다:

**"공간을 잘게 쪼개어 변화를 보았다면, 이제 그 미세한 변화량들을 다시 차곡차곡 쌓아 올려 '다차원 공간의 면적과 부피'를 재는 다변수 적분은 어떻게 정의해야 할까요?"**

0-B-8에서 배운 리만 상합과 하합은 다차원 상자 위에서 어떻게 작동할까요?

그리고 2중적분, 3중적분을 계산할 때 우리는 왜 1변수 적분을 차례대로 반복해서 계산할 수 있을까요?

다음 장인 **0-C-7. 다차원 영역의 적분 — 푸비니 정리와 다중적분** 에서, 다중적분을 반복적분으로 연결하는 **푸비니 정리(Fubini's Theorem)** 를 만나보겠습니다.
