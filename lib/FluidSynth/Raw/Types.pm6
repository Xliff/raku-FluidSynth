use v6;

use FluidSynth::Raw::Exports;

unit package FluidSynth::Raw::Types;

need FluidSynth::Raw::Definitions;
need FluidSynth::Raw::Enums;
need FluidSynth::Raw::Subs;
need FluidSynth::Raw::Traits;
need FluidSynth::Roles::Pointers;
need FluidSynth::Roles::Implementor;

BEGIN {
  glib-re-export($_) for |@fs-exports;
}
