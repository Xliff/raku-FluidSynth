use v6.c

use NativeCall;

use GLib::Raw::Definitions;
use FluidSynth::Raw::Definitions;

### /usr/include/fluidsynth/voice.h

sub fluid_voice_add_mod (fluid_voice_t $voice, fluid_mod_t $mod, gint $mode)
  is native(fluidsynth)
  is export
{ * }

sub fluid_voice_gen_get (fluid_voice_t $voice, gint $gen)
  returns gfloat
  is native(fluidsynth)
  is export
{ * }

sub fluid_voice_gen_incr (fluid_voice_t $voice, gint $gen, gfloat $val)
  is native(fluidsynth)
  is export
{ * }

sub fluid_voice_gen_set (fluid_voice_t $voice, gint $gen, gfloat $val)
  is native(fluidsynth)
  is export
{ * }

sub fluid_voice_get_actual_key (fluid_voice_t $voice)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_voice_get_actual_velocity (fluid_voice_t $voice)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_voice_get_channel (fluid_voice_t $voice)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_voice_get_id (fluid_voice_t $voice)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_voice_get_key (fluid_voice_t $voice)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_voice_get_velocity (fluid_voice_t $voice)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_voice_is_on (fluid_voice_t $voice)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_voice_is_playing (fluid_voice_t $voice)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_voice_is_sostenuto (fluid_voice_t $voice)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_voice_is_sustained (fluid_voice_t $voice)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_voice_optimize_sample (fluid_sample_t $s)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_voice_update_param (fluid_voice_t $voice, gint $gen)
  is native(fluidsynth)
  is export
{ * }
