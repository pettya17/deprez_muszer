#!/usr/bin/perl

use Tk;

$origo=190/2;
$mutatx=10;
$mutaty=190/2-50;

$mw=MainWindow->new();
$mw->geometry("300x200");
$c=$mw->Canvas(-width=>190,-height=>190,
                -bg => 'gray')->place(-x=>4,-y=>4);

$i=0;
$line=$c->createLine(($origo),($origo),($mutatx),($mutaty),
                      -arrow=>'last');

MainLoop();

$mw->repeat(100,\&mozog);

sub mozog
{
    $szazalek++;

    if($szazalek==100){$szazalek=0;}
    \&mutat();
}