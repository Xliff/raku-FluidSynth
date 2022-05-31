use v6.c;

unit package FluidSynth::Raw::Exports;

use CompUnit::Util :re-export;

our @fs-exports is export;

our %exported;

sub glib-re-export ($compunit) is export {
  return if %exported{$compunit}:exists;

  re-export-everything($compunit);
  %exported{$compunit} = True;
}

BEGIN {
  @fs-exports = <
    FluidSynth::Raw::Definitions
    FluidSynth::Raw::Enums
    FluidSynth::Raw::Subs
    FluidSynth::Raw::Traits
    FluidSynth::Roles::Implementor
    FluidSynth::Roles::Pointers
  >;
}
