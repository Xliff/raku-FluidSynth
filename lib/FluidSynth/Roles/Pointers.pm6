use v6.c;

use NativeCall;

use CompUnit::Util :re-export;

need FluidSynth::Roles::Implementor;
import FluidSynth::Roles::Implementor;

BEGIN re-export-everything('FluidSynth::Roles::Implementor');

# Number of times full project has needed to be compiled
my constant forced = 222;

# Mark
multi sub trait_mod:<is>(Attribute:D \attr, :$implementor!) is export {
  # YYY - Warning if a second attribute is marked?
  attr does Implementor;
}

constant FRI = FluidSynth::Roles::Implementor;

role FluidSynth::Roles::Pointers {

  method p {
    if self.REPR eq <CStruct CPointer>.any {
      self ~~ Pointer ?? self !! nativecast(Pointer, self);
    } elsif FLR::findProperImplementor(self.^attributes) -> \i {
      nativecast( Pointer, i.get_value(self) )
    } else {
      self ~~ Pointer ?? self !! nativecast(Pointer, self);
    }
  }

  method Numeric {
    +self.p;
  }

}
