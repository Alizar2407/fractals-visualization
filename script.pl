use strict;
use warnings;
use Switch;
use Math::Trig;
use GD::Simple;
 
=begin comment
"F" – переместиться вперед на шаг h в направлении a, оставив след (нарисовав отрезок);
"f" – переместиться вперед на шаг h в направлении a, не оставляя следа;
"+" – повернуть направо (по часовой стрелке) на угол b (изменить направление движения);
"–" – повернуть налево (против часовой стрелки) на угол b (изменить направление движения);
"[" – запомнить (отложить в стек) текущее состояние (x, y, a);
"]" – вспомнить (взять из стека и установить) последнее сохраненное в памяти состояние (x, y, a);
=end comment
=cut

sub main()
{
    my $instructions = "F"; # начальная последовательность
    my %rules = # правила вывода для данной L-системы
    (
        F => 'FF+[+F-F-F]-[-F+F+F]',
        # X => '-YF+XFX+FY-',
        # Y => '+XF-YFY-FX+'
    );
    my $betta = 180/8; # угол поворота для данной L-системы

    my $detalisation = 5; # уровень рекурсии
    my $h = 7; # длина линии

    my @xStack = (500); # начальная координата x
    my @yStack = (900); # начальная координата y
    my @alphaStack = (270); # начальный угол поворота alpha
        
    for (my $i=0; $i<$detalisation; ++$i)
    {
        $instructions = $instructions =~ s/([F])/$rules{$1}/gr;
    }

    my $img = GD::Simple->new(1000, 1000); # размеры выходного изображения
    $img->fgcolor('black');
    
    my $x; my $y; my $alpha;
    $x = pop @xStack; $y = pop @yStack; $alpha = pop @alphaStack;

    for (split('', $instructions))
    {
        switch ($_)
        {
            case /F/
            {
                $img->moveTo($x, $y);
                $x += $h * cos(pi() * $alpha/180);
                $y += $h * sin(pi() * $alpha/180);
                $img->lineTo($x, $y);
            }
            case /f/
            {
                $x += $h * cos(pi() * $alpha/180);
                $y += $h * sin(pi() * $alpha/180);
                $img->moveTo($x, $y);
            }
            case /\+/
            {
                $alpha -= $betta;
            }
            case /\-/
            {
                $alpha += $betta;
            }
            case /\[/
            {
                push @xStack, $x; push @yStack, $y; push @alphaStack, $alpha;
            }
            case /\]/
            {
                $x = pop @xStack; $y = pop @yStack; $alpha = pop @alphaStack;
            }
        }
    }

    # saving
    my $file = 'img.png';
    open (my $fh, '>', $file) or die "cannot create a file: \"$file\"";

    binmode $fh;
    print $fh $img->png;
    close ($fh);
}

main();
