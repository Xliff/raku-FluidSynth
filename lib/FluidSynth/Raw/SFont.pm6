use v6.c;

use NativeCall;

use FluidSynth::Raw::Definitions;

unit package FluidSynth::Raw::SFont;

### /usr/include/fluidsynth/sfont.h

sub delete_fluid_preset (fluid_preset_t $preset)
  is native(fluidsynth)
  is export
{ * }

sub delete_fluid_sample (fluid_sample_t $sample)
  is native(fluidsynth)
  is export
{ * }

sub delete_fluid_sfloader (fluid_sfloader_t $loader)
  is native(fluidsynth)
  is export
{ * }

sub delete_fluid_sfont (fluid_sfont_t $sfont)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_preset_get_banknum (fluid_preset_t $preset)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_preset_get_data (fluid_preset_t $preset)
  is native(fluidsynth)
  is export
{ * }

sub fluid_preset_get_name (fluid_preset_t $preset)
  returns Str
  is native(fluidsynth)
  is export
{ * }

sub fluid_preset_get_num (fluid_preset_t $preset)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_preset_get_sfont (fluid_preset_t $preset)
  returns fluid_sfont_t
  is native(fluidsynth)
  is export
{ * }

sub fluid_preset_set_data (fluid_preset_t $preset, Pointer $data)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_sample_set_loop (
  fluid_sample_t $sample,
  gint           $loop_start,
  gint           $loop_end
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_sample_set_name (fluid_sample_t $sample, Str $name)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_sample_set_pitch (
  fluid_sample_t $sample,
  gint           $root_key,
  gint           $fine_tune
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_sample_set_sound_data (
  fluid_sample_t $sample,
  short          $data,
  Pointer        $data24,
  gint           $nbframes,
  gint           $sample_rate,
  short          $copy_data
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_sample_sizeof ()
  returns size_t
  is native(fluidsynth)
  is export
{ * }

sub fluid_sfloader_get_data (fluid_sfloader_t $loader)
  is native(fluidsynth)
  is export
{ * }

sub fluid_sfloader_set_callbacks (
  fluid_sfloader_t $loader,
                   &open  (Str --> gint),                            #= fluid_sfloader_callback_open_t
                   &read  (CArray[uint8], glong, Pointer --> gint),  #= fluid_sfloader_callback_read_t
                   &seek  (Pointer, glong, gint --> gint),           #= fluid_sfloader_callback_seek_t
                   &tell  (Pointer --> glong),                       #= fluid_sfloader_callback_tell_t
                   &close (Pointer)                                  #= fluid_sfloader_callback_close_t
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_sfloader_set_data (fluid_sfloader_t $loader, Pointer $data)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_sfont_get_data (fluid_sfont_t $sfont)
  is native(fluidsynth)
  is export
{ * }

sub fluid_sfont_get_id (fluid_sfont_t $sfont)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_sfont_get_name (fluid_sfont_t $sfont)
  returns Str
  is native(fluidsynth)
  is export
{ * }

sub fluid_sfont_get_preset (fluid_sfont_t $sfont, gint $bank, gint $prenum)
  returns fluid_preset_t
  is native(fluidsynth)
  is export
{ * }

sub fluid_sfont_iteration_next (fluid_sfont_t $sfont)
  returns fluid_preset_t
  is native(fluidsynth)
  is export
{ * }

sub fluid_sfont_iteration_start (fluid_sfont_t $sfont)
  is native(fluidsynth)
  is export
{ * }

sub new_fluid_defsfloader (fluid_settings_t $settings)
  returns fluid_sfloader_t
  is native(fluidsynth)
  is export
{ * }

sub new_fluid_preset (
  fluid_sfont_t $parent_sfont,
                &get_name (fluid_preset_t --> gint),                                   #= fluid_preset_get_name_t
                &get_bank (fluid_preset_t --> gint),                                   #= fluid_preset_get_banknum_t
                &get_num  (fluid_preset_t --> gint),                                   #= fluid_preset_get_num_t
                &noteon   (fluid_preset_t, fluid_synth_t, gint, gint, gint --> gint),  #= fluid_preset_noteon_t
                &free     (fluid_preset_t)                                             #= fluid_preset_free_t
)
  returns fluid_preset_t
  is native(fluidsynth)
  is export
{ * }

sub new_fluid_sample ()
  returns fluid_sample_t
  is native(fluidsynth)
  is export
{ * }

sub new_fluid_sfloader (
  &load (fluid_sfloader_t, Str --> fluid_sfont_t),
  &free (fluid_sfloader_t),
)
  returns fluid_sfloader_t
  is native(fluidsynth)
  is export
{ * }

sub new_fluid_sfont (
  &get_name   (fluid_sfont_t --> Str),                         #= fluid_sfont_get_name_t
  &get_preset (fluid_sfont_t, gint, gint --> fluid_preset_t),  #= fluid_sfont_get_preset_t
  &iter_start (fluid_sfont_t --> fluid_preset_t),              #= fluid_sfont_iteration_start_t
  &iter_next  (fluid_sfont_t --> fluid_preset_t),              #= fluid_sfont_iteration_next_t
  &free       (fluid_sfont_t)                                  #= fluid_sfont_free_t
)
  returns fluid_sfont_t
  is native(fluidsynth)
  is export
{ * }

sub fluid_sfont_set_data (fluid_sfont_t $sfont, Pointer $data)
  returns gint
  is native(fluidsynth)
  is export
{ * }
