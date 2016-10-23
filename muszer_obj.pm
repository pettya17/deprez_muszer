#!/usr/bin/perl

package DEPREZ;


use Tk;
use Math::Complex;
use Math::Trig;
use Time::HiRes;
use Thread;

sub new
{
    my ($type, $mv, $koord_x, $koord_y, $atmero, $kezdet, $veg, $ertek)=@_;
    my $self={};

    $self->{felulet}=$mv;
    $self->{koord_x}=$koord_x;
    $self->{koord_y}=$koord_y;
    $self->{atmero}=$atmero;
    $self->{skala_kezdet}=$kezdet;
    $self->{skala_veg}=$veg;
    $self->{ertek}=$ertek;
    $self->{szazalek}=$szazalek;
    $self->{fok}=$fok;
    $self->{origo}=$origo;
    $self->{mutat_vect}=$mutat_vect;
    $self->{mutatx}=$mutatx;
    $self->{mutaty}=$mutaty;
    $self->{Canvas}=$c;
    $self->{kor_szelet}=$arc;
    $self->{mutato}=$mutato;

    return bless($self,$type);
}

sub init
{
    my $self=shift;
    my $mw=$_[0];

    $self->{mutat_vect}=$self->{atmero}/2+10;
    $self->{origo}=$self->{atmero}/2+10;
    $self->{fok}=(180+45)-($self->{szazalek} * ( 270 / 100 ));
    $self->{szazalek}=(100/($self->{skala_veg}-$self->{skala_kezdet}))*($self->{ertek}-$self->{skala_kezdet});
    $self->{Canvas}=$$mw->Canvas(-width=>($self->{atmero}+20),-height=>$self->{atmero}+5,
                                    -bg => 'gray')->place(-x=>$self->{koord_x},-y=>$self->{koord_y});
    $self->{kor_szelet}=$self->{Canvas}->createArc(10,10,($self->{atmero}+10),($self->{atmero}+10),
                                                    -extent=>270,
                                                    -start=>-45,
                                                    -style=>'chord');
}

sub mutat
{
    my $self=shift;

    $self->{szazalek}=(100/($self->{skala_veg}-$self->{skala_kezdet}))*($self->{ertek}-$self->{skala_kezdet});

    if($self->{szazalek}<(100/6))
    {
        $self->{mutaty}=$self->{origo}+(sin(deg2rad($self->{fok}-180))*$self->{mutat_vect});
        $self->{mutatx}=$self->{origo}-(cos(deg2rad($self->{fok}-180))*$self->{mutat_vect});
    }
    if(($self->{szazalek}>(100/6))&&($self->{szazalek}<(100/2)))
    {
        $self->{mutaty}=$self->{origo}-(sin(deg2rad(180-$self->{fok}))*$self->{mutat_vect});
        $self->{mutatx}=$self->{origo}-(cos(deg2rad(180-$self->{fok}))*$self->{mutat_vect});
    }
    if(($self->{szazalek}>(100/2))&&($self->{szazalek}<(100*(5/6))))
    {
        $self->{mutaty}=$self->{origo}-(sin(deg2rad($self->{fok}))*$self->{mutat_vect});
        $self->{mutatx}=$self->{origo}+(cos(deg2rad($self->{fok}))*$self->{mutat_vect});
    }if(($self->{szazalek}>(100*(5/6))))
    {
        $self->{mutaty}=$self->{origo}+(sin(deg2rad(360-$self->{fok}))*$self->{mutat_vect});
        $self->{mutatx}=$self->{origo}+(cos(deg2rad(360-$self->{fok}))*$self->{mutat_vect});
    }
    $self->{mutato}=$self->{Canvas}->createLine(($self->{origo}),($self->{origo}),
                                                ($self->{mutatx}),($self->{mutaty}),
                                                   -arrow=>'last');    
}

return 1;