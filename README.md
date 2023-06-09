# Визуализация L-систем

Программа позволяет отрисовывать фракталы, представленные в виде L–систем.

L–система состоит из начальной последовательности действий и набора правил, позволяющих вывести новую последовательность. На каждой итерации фрагменты последовательности, соответствующие левым частям каждого правила, заменяются правыми частями тех же правил, увеличивая детализацию выходного изображения. После формирования последовательности на последней итерации команды выполняются, отрисовывая результирующее изображение.

---

В L–системах обычно используются следующие команды:
* "F" – переместиться вперед на шаг *h* в направлении *alpha*, оставив след (нарисовав отрезок)
* "f" – переместиться вперед на шаг *h* в направлении *alpha*, не оставляя следа
* "+" – повернуть направо (по часовой стрелке) на угол *betta* (изменить направление движения)
* "–" – повернуть налево (против часовой стрелки) на угол *betta* (изменить направление движения)
* "[" – запомнить (отложить в стек) текущее состояние (*x*, *y*, *alpha*)
* "]" – вспомнить (взять из стека и установить) последнее сохраненное в памяти состояние (*x*, *y*, *alpha*)

---

Ниже приведен результат отрисовки снежинки Коха при уровне детализации, равном 5.
> ***Начальная последовательность:*** F++F++F
>
> ***Правило вывода:*** F -> F-F++F-F
>
> ***Угол поворота betta:*** 60 °

![koha](/assets/koha.png)

---

Ветка дерева при уровне детализации, равном 5:
> ***Начальная последовательность:*** F
>
> ***Правило вывода:*** F -> FF+[+F-F-F]-[-F+F+F]
>
> ***Угол поворота betta:*** 180 / 8 °

![tree](/assets/tree.png)

---

Кривая Гильберта при уровне детализации, равном 5:
> ***Начальная последовательность:*** X
>
> ***Правила вывода:***
>
> * X => '-YF+XFX+FY-',
>
> * Y => '+XF-YFY-FX+'
>
> ***Угол поворота betta:*** 90 °

![hilbert](/assets/hilbert.png)
