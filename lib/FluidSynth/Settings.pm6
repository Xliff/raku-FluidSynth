use v6.c;

use NativeCall;

use FluidSynth::Raw::Types;
use FluidSynth::Raw::Settings;

class FluidSynth::Settings {
  has fluid_settings_t $!fs is implementor;

  submethod BUILD ( :$fluid-settings ) {
    $!fs = $fluid-settings;
  }

  method FluidSynth::Raw::Definitions::fluid_settings_t
  { $!fs }

  multi method new (fluid_settings_t $fluid-settings) {
    $fluid-settings ?? self.bless( :$fluid-settings ) !! Nil;
  }
  multi method new {
    self.new_fluid_settings;
  }

  method new_fluid_settings {
    my $fluid-settings = new_fluid_settings($!fs);

    $fluid-settings ?? self.bless( :$fluid-settings ) !! Nil;
  }

  method copystr (Str $name, Str $str, gint $len) {
    fluid_settings_copystr($!fs, $name, $str, $len);
  }

  method delete_fluid_settings {
    delete_fluid_settings($!fs);
  }

  method dupstr (Str $name, CArray[Str] $str) {
    fluid_settings_dupstr($!fs, $name, $str);
  }

  multi method foreach (&func, Pointer $data = Pointer) {
    samewith($data, &func);
  }
  multi method foreach (Pointer $data, &func) {
    fluid_settings_foreach($!fs, $data, $func);
  }

  proto method foreach_option (|)
  { * }

  method foreach_option (
    Str     $name,
            &func,
    Pointer $data  = Pointer
  ) {
    samewith($name, $data, &func);
  }
  method foreach_option (
    Str     $name,
    Pointer $data,
            &func
  ) {
    fluid_settings_foreach_option($!fs, $name, $data, $func);
  }

  proto method get_hints (|)
  { * }

  method get_hints (Str $name) {
    samewith($name, $);
  }
  method get_hints (Str $name, $val is rw) {
    my gint $v = 0;

    my $rv = fluid_settings_get_hints($!fs, $name, $v);
    $val = $v;
    $rv ?? $val !! Nil
  }

  method get_type (Str() $name) {
    fluid_settings_get_type($!fs, $name);
  }

  method getint (Str $name) {
    samewith($name, $);
  }
  method getint (Str $name, $val is rw) {
    my gint $v  = 0;
    my      $rv = fluid_settings_getint($!fs, $name, $v);

    $val = $v;
    $rv ?? $val !! Nil
  }

  proto method getint_default (|)
  { * }

  multi method getint_default (Str() $name) {
    samewith($name, $);
  }
  multi method getint_default (Str() $name, $val is rw) {
    my gint $v  = 0;
    my      $rv = fluid_settings_getint_default($!fs, $name, $v);

    $val = $v;
    $rv ?? $val !! Nil
  }

  proto method getint_range (|)
  { * }

  multi method getint_range (Str() $name, :$range = True) {
    samewith($str, $, $, :$range);
  }
  multi method getint_range (Str $name, $min is rw, $max is rw) {
    my gdouble ($mn, $mx) = 0e0 xx 2;

    my $rv = fluid_settings_getint_range($!fs, $name, $mn, $mx);
    ($min, $max) = ($mn, $mx);
    $range ?? ($min..$max) !! ($min, $max);
  }

  method getnum (Str() $name) {
    samewith($name, $);
  }
  method getnum (Str() $name, $val is rw) {
    my gint $v  = 0;
    my      $rv = fluid_settings_getnum($!fs, $name, $v);

    $val = $v;
    $rv ?? $val !! Nil
  }

  proto method getnum_default (|)

  multi method getnum_default (Str() $name) {
    samewith($name, $);
  }
  multi method getnum_default (Str() $name, $val is rw) {
    my gint $v  = 0e0;
    my      $rv = fluid_settings_getnum_default($!fs, $name, $v);

    $val = $v;
    $rv ?? $val !! Nil
  }

  proto method getnum_range (|)
  { * }

  multi method getnum_range (Str() $name, :$range = True) {
    samewith($str, $, $, :$range);
  }
  multi method getnum_range (
    Str()  $name,
           $min        is rw,
           $max        is rw,
          :$range             = True
  ) {
    my gdouble ($mn, $mx) = 0e0 xx 2;

    my $rv = fluid_settings_getnum_range($!fs, $name, $mn, $mx);
    ($min, $max) = ($mn, $mx);
    $range ?? ($min..$max) !! ($min, $max);
  }

  proto method getstr_default (|)
  { * }

  multi method getstr_default (Str() $name) {
    samewith( $name, newCArray(Str) )
  }
  multi method getstr_default (Str() $name, CArray[Str] $def) {
    fluid_settings_getstr_default($!fs, $name, $def);
  }

  method is_realtime (Str() $name) {
    so fluid_settings_is_realtime($!fs, $name);
  }

  method option_concat (Str() $name, Str() $separator) {
    fluid_settings_option_concat($!fs, $name, $separator);
  }

  method option_count (Str() $name) {
    fluid_settings_option_count($!fs, $name);
  }

  method setint (Str $name, Int() $val) {
    my gint $v = $val;

    fluid_settings_setint($!fs, $name, $v);
  }

  method setnum (Str() $name, Num() $val) {
    my gdouble $v = $val;

    fluid_settings_setnum($!fs, $name, $v);
  }

  method setstr (Str() $name, Str() $str) {
    fluid_settings_setstr($!fs, $name, $str);
  }

  method str_equal (Str() $name, Str() $value) {
    fluid_settings_str_equal($!fs, $name, $value);
  }

}
