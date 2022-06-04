use v6.c;

use NativeCall;

use FluidSynth::Raw::Definitions;

unit package FluidSynth::Raw::LADSPA;

### /usr/include/fluidsynth/ladspa.h

sub fluid_ladspa_activate (fluid_ladspa_fx_t $fx)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_ladspa_add_buffer (fluid_ladspa_fx_t $fx, Str $name)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_ladspa_add_effect (
  fluid_ladspa_fx_t $fx,
  Str               $effect_name,
  Str               $lib_name,
  Str               $plugin_name
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_ladspa_buffer_exists (fluid_ladspa_fx_t $fx, Str $name)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_ladspa_check (fluid_ladspa_fx_t $fx, Str $err, gint $err_size)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_ladspa_deactivate (fluid_ladspa_fx_t $fx)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_ladspa_effect_can_mix (fluid_ladspa_fx_t $fx, Str $name)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_ladspa_effect_link (
  fluid_ladspa_fx_t $fx,
  Str               $effect_name,
  Str               $port_name,
  Str               $name
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_ladspa_effect_port_exists (
  fluid_ladspa_fx_t $fx,
  Str               $effect_name,
  Str               $port_name
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_ladspa_effect_set_control (
  fluid_ladspa_fx_t $fx,
  Str               $effect_name,
  Str               $port_name,
  gfloat            $val
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_ladspa_effect_set_mix (
  fluid_ladspa_fx_t $fx,
  Str               $name,
  gint              $mix,
  gfloat            $gain
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_ladspa_host_port_exists (fluid_ladspa_fx_t $fx, Str $name)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_ladspa_is_active (fluid_ladspa_fx_t $fx)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_ladspa_reset (fluid_ladspa_fx_t $fx)
  returns gint
  is native(fluidsynth)
  is export
{ * }
