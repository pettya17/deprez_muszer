#!/usr/bin/perl

use Tk;
use Math::Complex;
use Math::Trig;
use Time::HiRes;
use Thread;

$szazalek=0;
$atmero=300;

$x0=10;
$y0=10;
$fok=(180+45)-($szazalek*(270/100));
$origo=$atmero/2+10;
$mutat_vect=$atmero/2;
$mutatx=90;
$mutaty=40;

$mw=MainWindow->new();
$mw->geometry("350x350");

$c=$mw->Canvas(-width=>($atmero+20),-height=>$atmero+5,
                -bg => 'gray')->place(-x=>$x0,-y=>$y0);
$arc=$c->createArc(10,10,($atmero+10),($atmero+10),
                    -extent=>270,
                    -start=>-45,
                    -style=>'chord');
$line=$c->createLine(($origo),($origo),($mutatx),($mutaty),
                      -arrow=>'last');          

$mw->repeat(100,\&mozog);

MainLoop();

sub mutat
{
    $fok=(180+45)-($szazalek*(270/100));
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
    $c->coords($line,$origo,$origo,$mutatx,$mutaty);
}
sub mozog
{
    $szazalek++;

    if($szazalek==100){$szazalek=0;}
    \&mutat();
}