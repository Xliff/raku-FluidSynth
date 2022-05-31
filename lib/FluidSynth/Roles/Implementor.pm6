use v6.c;

# This is required for proper compilation.

our role Implementor is export {}

multi sub trait_mod:<is>(Attribute:D \attr, :$implementor!) {
  attr does Implementor;
}

# Find.
sub findProperImplementor ( $attrs, :rev(:$reverse) ) is export {
  # Will need to search the entire attributes list for the
  # proper main variable. Then sort for the one with the largest
  # MRO.

  sub sort-mro (@a) {
    sub get-mro (\i) {
      my \mro = i.package.HOW.?mro($);
      mro ~~ List ?? mro.elems !! 0
    }

    @a.sort( -> $a, $b {
      $b.&get-mro <=> $a.&get-mro
    });
  }

  my @attributes   = $attrs.cache;
  my @implementors = @attributes.grep( * ~~ Implementor ).&sort-mro;
  @implementors .= reverse if $reverse;

  my ($idx, $attr, $type) = (0);

  if +@implementors {
    repeat {
      $attr = @implementors[$idx++];

      $type = $attr.?type;
      return $attr unless $type === (Any, Nil).any;
    } until $idx > +@implementors;
  }

  # No imlementors found. Try the attribute with the largest
  # MRO.
  if +@attributes {
    @attributes = @attributes.&sort-mro;
    $idx = 0;
    repeat {
      $attr = @attributes[$idx++];

      #print  " FPI: { $attr.type.^name } / { $attr.name } ";
      next if $attr === (Any, Nil).any;
      $type = $attr.?type;
    } until $type.^name ne <Mu Any Nil>.any or $idx > +@attributes;
  }
  $attr;
}

our role FluidSynth::Roles::Implementor {

  method getImplementor {
    findProperImplementor(self.^attributes);
  }

  method getTypePair {
    my \i  = self.getImplementor;
    return Nil if i === Nil;
    my \ft = i.type;

    (
      ft.HOW ~~ Metamodel::CoercionHOW ?? ft.^target_type !! ft,
      self.WHAT
    )
  }

}
