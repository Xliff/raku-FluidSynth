use v6.c;

use NativeCall;

use FluidSynth::Raw::Definitions;

unit package FluidSynth::Raw::Settings;

### /usr/include/fluidsynth/settings.h

sub fluid_settings_copystr (
  fluid_settings_t $settings,
  Str              $name,
  CArray[uint8]    $str,
  gint             $len
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub delete_fluid_settings (fluid_settings_t $settings)
  is native(fluidsynth)
  is export
{ * }

sub fluid_settings_dupstr (
  fluid_settings_t $settings,
  Str              $name,
  CArray[Str]      $str
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_settings_foreach (
  fluid_settings_t $settings,
  Pointer          $data,
                   &func (gpointer, Str, gint)
)
  is native(fluidsynth)
  is export
{ * }

sub fluid_settings_foreach_option (
  fluid_settings_t $settings,
  Str              $name,
  Pointer          $data,
                   &func (gpointer, Str, Str)
)
  is native(fluidsynth)
  is export
{ * }

sub fluid_settings_get_hints (
  fluid_settings_t $settings,
  Str              $name,
  gint             $val       is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_settings_get_type (fluid_settings_t $settings, Str $name)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_settings_getint (
  fluid_settings_t $settings,
  Str              $name,
  gint             $val       is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_settings_getint_default (
  fluid_settings_t $settings,
  Str              $name,
  gint             $val       is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_settings_getint_range (
  fluid_settings_t $settings,
  Str              $name,
  gint             $min       is rw,
  gint             $max       is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_settings_getnum (
  fluid_settings_t $settings,
  Str              $name,
  gdouble          $val       is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_settings_getnum_default (
  fluid_settings_t $settings,
  Str              $name,
  gdouble          $val       is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_settings_getnum_range (
  fluid_settings_t $settings,
  Str              $name,
  gdouble          $min is rw,
  gdouble          $max is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_settings_getstr_default (
  fluid_settings_t $settings,
  Str              $name,
  CArray[Str]      $def
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_settings_is_realtime (fluid_settings_t $settings, Str $name)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub new_fluid_settings ()
  returns fluid_settings_t
  is native(fluidsynth)
  is export
{ * }

sub fluid_settings_option_concat (
  fluid_settings_t $settings,
  Str              $name,
  Str              $separator
)
  returns Str
  is native(fluidsynth)
  is export
{ * }

sub fluid_settings_option_count (fluid_settings_t $settings, Str $name)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_settings_setint (fluid_settings_t $settings, Str $name, gint $val)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_settings_setnum (fluid_settings_t $settings, Str $name, gdouble $val)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_settings_setstr (fluid_settings_t $settings, Str $name, Str $str)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_settings_str_equal (
  fluid_settings_t $settings,
  Str              $name,
  Str              $value
)
  returns gint
  is native(fluidsynth)
  is export
{ * }
