#!/usr/bin/perl

# A Canvas magasságának meghatározását finomítani kell, mert az átmérő változásával
# változik a körcikk alatt lévő szabad terület mérete, de nem marad megfelelő mértékű hely.

use Tk;
use Math::Complex;
use Math::Trig;

$szazalek=0;

$x0=10;
$y0=10;
$atmero=300;
$fok=(180+45)-($szazalek*(270/100));
$origo=$atmero/2+10;
$mutat_vect=$atmero/2;
$mutatx=0;
$mutaty=0;

$proba=sin(deg2rad(45));
$proba2=cos(deg2rad(45));
print "$proba"."\n"."$proba2";

$mw=MainWindow->new();
$mw->geometry("350x350");

$c=$mw->Canvas(-width=>($atmero+20),-height=>$atmero+5,
                -bg => 'gray')->place(-x=>$x0,-y=>$y0);
$arc=$c->createArc(10,10,($atmero+10),($atmero+10),
                    -extent=>270,
                    -start=>-45,
                    -style=>'chord');
# $line=$c->createLine(($origo),($origo),($mutatx),($mutaty),
#                      -arrow=>'last');
&mutat;#(\$mutatx,\$mutaty);
MainLoop();

sub mutat
{
    # my $mutatx=$_[0]; my $mutaty=$_[1];
    if($szazalek<(100/6))
    {
        $mutaty=$origo+(sin(deg2rad($fok-180))*$mutat_vect);
        $mutatx=$origo-(cos(deg2rad($fok-180))*$mutat_vect);
    }
    if(($szazalek>(100/6))&&($szazalek<(100/2)))
    {
        $mutaty=$origo-(sin(deg2rad(180-$fok))*$mutat_vect);
        $mutatx=$origo-(cos(deg2rad(180-$fok))*$mutat_vect);
    }
    if(($szazalek>(100/2))&&($szazalek<(100*(5/6))))
    {
        $mutaty=$origo-(sin(deg2rad($fok))*$mutat_vect);
        $mutatx=$origo+(cos(deg2rad($fok))*$mutat_vect);
    }if(($szazalek>(100*(5/6))))
    {
        $mutaty=$origo+(sin(deg2rad(360-$fok))*$mutat_vect);
        $mutatx=$origo+(cos(deg2rad(360-$fok))*$mutat_vect);
    }
    $line=$c->createLine(($origo),($origo),($mutatx),($mutaty),
                         -arrow=>'last');
    print "\n"."$mutatx"."\n"."$mutaty";
    
}