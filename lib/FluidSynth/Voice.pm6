use v6.c;

use FluidSynth::Raw::Types;
use FluidSynth::Raw::Voice;

class FluidSynth::Voice {
  has fluid_voice_t $!fv;

  submethod BUILD ( :$fluid-voice ) {
    $!fv = $fluid-voice;
  }

  method FluidSynth::Raw::Definitions::fluid_voice_t
  { $!fv }

  method new (fluid_voice_t $fluid-voice) {
    $fluid-voice ?? self.bless( :$fluid-voice ) !! Nil;
  }

  method add_mod (fluid_mod_t $mod, gint $mode) {
    my gint $m = $mode;

    fluid_voice_add_mod($!fv, $mod, $m);
  }

  method gen_get (Int() $gen) {
    my gint $g = $gen;

    fluid_voice_gen_get($!fv, $g);
  }

  method gen_incr (Int() $gen, Num() $val) {
    my gint   $g = $gen;
    my gfloat $v = $val;

    fluid_voice_gen_incr($!fv, $gen, $val);
  }

  method gen_set (Int() $gen, Num() $val) {
    my gint   $g = $gen;
    my gfloat $v = $val;

    fluid_voice_gen_set($!fv, $g, $v);
  }

  method get_actual_key {
    fluid_voice_get_actual_key($!fv);
  }

  method get_actual_velocity {
    fluid_voice_get_actual_velocity($!fv);
  }

  method get_channel {
    fluid_voice_get_channel($!fv);
  }

  method get_id {
    fluid_voice_get_id($!fv);
  }

  method get_key {
    fluid_voice_get_key($!fv);
  }

  method get_velocity {
    fluid_voice_get_velocity($!fv);
  }

  method is_on {
    fluid_voice_is_on($!fv);
  }

  method is_playing {
    fluid_voice_is_playing($!fv);
  }

  method is_sostenuto {
    fluid_voice_is_sostenuto($!fv);
  }

  method is_sustained {
    fluid_voice_is_sustained($!fv);
  }

  method optimize_sample {
    fluid_voice_optimize_sample($!fv);
  }

  method update_param (Int() $gen) {
    my gint $g = $gen;

    fluid_voice_update_param($!fv, $g);
  }

}
