use v6.c;

use FluidSynth::Raw::Types;
use FluidSynth::Raw::LADSPA;

use FluidSynth::Roles::Implementor;

class FluidSynth::LADSPA {
  also does FluidSynth::Roles::Implementor;

  has fluid_ladspa_fx_t $!fl is implementor;

  method activate {
    fluid_ladspa_activate($!fl);
  }

  method add_buffer (Str() $name) {
    fluid_ladspa_add_buffer($!fl, $name);
  }

  method add_effect (
    Str() $effect_name,
    Str() $lib_name,
    Str() $plugin_name
  ) {
    fluid_ladspa_add_effect($!fl, $effect_name, $lib_name, $plugin_name);
  }

  method buffer_exists (Str() $name) {
    fluid_ladspa_buffer_exists($!fl, $name);
  }

  method check (Str() $err, Int() $err_size) {
    my gint $e = $err_size;

    fluid_ladspa_check($!fl, $err, $e);
  }

  method deactivate {
    fluid_ladspa_deactivate($!fl);
  }

  method effect_can_mix (Str() $name) {
    fluid_ladspa_effect_can_mix($!fl, $name);
  }

  method effect_link (Str() $effect_name, Str() $port_name, Str() $name) {
    fluid_ladspa_effect_link($!fl, $effect_name, $port_name, $name);
  }

  method effect_port_exists (Str() $effect_name, Str() $port_name) {
    fluid_ladspa_effect_port_exists($!fl, $effect_name, $port_name);
  }

  method effect_set_control (
    Str() $effect_name,
    Str() $port_name,
    Num() $val
  ) {
    my gfloat $v = $val;

    fluid_ladspa_effect_set_control($!fl, $effect_name, $port_name, $v);
  }

  method effect_set_mix (Str() $name, Int() $mix, Num() $gain) {
    my gint   $m = $mix;
    my gfloat $g = $gain;

    fluid_ladspa_effect_set_mix($!fl, $name, $m, $g);
  }

  method host_port_exists (Str() $name) {
    fluid_ladspa_host_port_exists($!fl, $name);
  }

  method is_active {
    so fluid_ladspa_is_active($!fl);
  }

  method reset {
    fluid_ladspa_reset($!fl);
  }

}
