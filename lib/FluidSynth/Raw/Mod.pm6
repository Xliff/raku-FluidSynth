use v6.c;

use NativeCall;

use FluidSynth::Raw::Definitions;

unit package FluidSynth::Raw::Mod;

### /usr/include/fluidsynth/mod.h

sub fluid_mod_clone (fluid_mod_t $mod, fluid_mod_t $src)
  is native(fluidsynth)
  is export
{ * }

sub delete_fluid_mod (fluid_mod_t $mod)
  is native(fluidsynth)
  is export
{ * }

sub fluid_mod_get_amount (fluid_mod_t $mod)
  returns gdouble
  is native(fluidsynth)
  is export
{ * }

sub fluid_mod_get_dest (fluid_mod_t $mod)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_mod_get_flags1 (fluid_mod_t $mod)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_mod_get_flags2 (fluid_mod_t $mod)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_mod_get_source1 (fluid_mod_t $mod)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_mod_get_source2 (fluid_mod_t $mod)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_mod_has_dest (fluid_mod_t $mod, gint $gen)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_mod_has_source (fluid_mod_t $mod, gint $cc, gint $ctrl)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub new_fluid_mod ()
  returns fluid_mod_t
  is native(fluidsynth)
  is export
{ * }

sub fluid_mod_set_amount (fluid_mod_t $mod, gdouble $amount)
  is native(fluidsynth)
  is export
{ * }

sub fluid_mod_set_dest (fluid_mod_t $mod, gint $dst)
  is native(fluidsynth)
  is export
{ * }

sub fluid_mod_set_source1 (fluid_mod_t $mod, gint $src, gint $flags)
  is native(fluidsynth)
  is export
{ * }

sub fluid_mod_set_source2 (fluid_mod_t $mod, gint $src, gint $flags)
  is native(fluidsynth)
  is export
{ * }

sub fluid_mod_sizeof ()
  returns size_t
  is native(fluidsynth)
  is export
{ * }

sub fluid_mod_test_identity (fluid_mod_t $mod1, fluid_mod_t $mod2)
  returns gint
  is native(fluidsynth)
  is export
{ * }
