use v6.c;

use FluidSynth::Raw::Types;
use FluidSynth::Raw::Mod;

class FluidSynth::Mod {
  has fluid_mod_t $!fm is implementor;

  submethod BUILD ( :$fluid-mod ) {
    $!fm = $fluid-mod;
  }

  method FluidSynth::Raw::Definitions::fluid_mod_t
  { $!fm }

  multi method new (fluid_mod_t $fluid-mod) {
    $fluid-mod ?? self.bless( :$fluid-mod ) !! Nil;
  }
  multi method new {
    self.new_fluid_mod
  }

  method new_fluid_mod {
    new_fluid_mod();
  }

  method clone (fluid_mod_t() $src) {
    fluid_mod_clone($!fm, $src);
  }

  method delete_fluid_mod {
    delete_fluid_mod($!fm);
  }

  method get_amount {
    fluid_mod_get_amount($!fm);
  }

  method get_dest {
    fluid_mod_get_dest($!fm);
  }

  method get_flags1 {
    fluid_mod_get_flags1($!fm);
  }

  method get_flags2 {
    fluid_mod_get_flags2($!fm);
  }

  method get_source1 {
    fluid_mod_get_source1($!fm);
  }

  method get_source2 {
    fluid_mod_get_source2($!fm);
  }

  method has_dest (Int() $gen) {
    my gint $g = $gen;

    fluid_mod_has_dest($!fm, $g);
  }

  method has_source (Int() $cc, Int() $ctrl) {
    my gint ($c, $ct) = ($cc, $ctrl);

    fluid_mod_has_source($!fm, $c, $ct);
  }

  method set_amount (Num() $amount) {
    my gdouble $a = $amount;

    fluid_mod_set_amount($!fm, $a);
  }

  method set_dest (Int() $dst) {
    my gint $d = $dst;

    fluid_mod_set_dest($!fm, $d);
  }

  method set_source1 (Int() $src, Int() $flags) {
    my gint ($s, $f) = ($src, $flags);

    fluid_mod_set_source1($!fm, $s, $f);
  }

  method set_source2 (Int() $src, Int() $flags) {
    my gint ($s, $f) = ($src, $flags);

    fluid_mod_set_source2($!fm, $s, $f);
  }

  method sizeof {
    fluid_mod_sizeof();
  }

  method test_identity (fluid_mod_t() $mod2) {
    fluid_mod_test_identity($!fm, $mod2);
  }

}
