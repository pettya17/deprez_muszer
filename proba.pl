#!/usr/bin/perl

use Tk;
use muszer_obj;
# use Math::Complex;
# use Math::Trig;
# use Time::HiRes;
# use Thread;

$mw=MainWindow->new();
$mw->geometry("350x350");

$analog=DEPREZ->new(\$mw,10,10,300,100,300,170);
$analog->init(\$mw);
$analog->mutat();

#$mw->repeat(100,\&mozog);

MainLoop();

# sub mozog
# {
#     $analog->{szazalek}++;

#     if($analog->{szazalek}==100){$analog->{szazalek}=0;}
#     $analog->mutat();
# }