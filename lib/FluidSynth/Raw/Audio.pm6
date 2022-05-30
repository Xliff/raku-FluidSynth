use v6.c;

use NativeCall;

use FluidSynth::Raw::Definitions;

unit package FluidSynth::Raw::Audio;

### /usr/include/fluidsynth/audio.h

sub delete_fluid_audio_driver (fluid_audio_driver_t $driver)
  is native(fluidsynth)
  is export
{ * }

sub delete_fluid_file_renderer (fluid_file_renderer_t $dev)
  is native(fluidsynth)
  is export
{ * }

sub fluid_audio_driver_register (CArray[Str] $adrivers)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_file_renderer_process_block (fluid_file_renderer_t $dev)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_file_set_encoding_quality (fluid_file_renderer_t $dev, gdouble $q)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub new_fluid_audio_driver (fluid_settings_t $settings, fluid_synth_t $synth)
  returns fluid_audio_driver_t
  is native(fluidsynth)
  is export
{ * }

sub new_fluid_audio_driver2 (
  fluid_settings_t   $settings, 
  fluid_audio_func_t $func,
  Pointer            $data
)
  returns fluid_audio_driver_t
  is native(fluidsynth)
  is export
{ * }

sub new_fluid_file_renderer (fluid_synth_t $synth)
  returns fluid_file_renderer_t
  is native(fluidsynth)
  is export
{ * }
