use v6.c;

use FluidSynth::Raw::Types;
use FluidSynth::Raw::SFont;

my $DEFAULT-FREE = -> *@a { free(@a.head) };

use FluidSynth::Roles::Implementor;

sub filterToPointer(
   $data,
  :$buf            = False,
  :$blob           = False,
  :array(:$carray) = False,
  :$encoding       = 'utf8'
{
  return $data unless $str || $buf || $blob || $carray;

  return cast(CArray[uint8], $data) if $carray;
  return cast(Buf,           $data) if $buf;
  return cast(Blob,          $data) if $blob;

  $data.decode($encoding);
}

class Fluid::Preset {
  also does FluidSynth::Roles::Implementor;

  has fluid_preset_t $!fp is implementor;

  method new (&get_name, &get_bank, &get_num, &noteon, &free) {
    self.new_fluid_preset(&get_name, &get_bank, &get_num, &noteon, &free);
  }

  method new_fluid_preset (&get_name, &get_bank, &get_num, &noteon, &free) {
    new_fluid_preset($!fs, $get_name, $get_bank, $get_num, $noteon, $free);
  }

  method delete_fluid_preset {
    delete_fluid_preset($!fs);
  }

  method cleanup {
    self.delete_fluid_preset;
  }

  method get_banknum {
    fluid_preset_get_banknum($!fs);
  }

  method get_data (
    :$buf            = False,
    :$blob           = False,
    :array(:$carray) = False,
    :$encoding       = 'utf8'
  ) {
    filterToPointer(
      fluid_preset_get_data($!fs),
      :$buf,
      :$blob,
      :$carray,
      :$encoding
    );
  }

  method get_name {
    fluid_preset_get_name($!fs);
  }

  method get_num {
    fluid_preset_get_num($!fs);
  }

  method get_sfont ( :$raw = False ) {
    propReturnObject(
      fluid_preset_get_sfont($!fs),
      $raw,
      |Fluid::SFont.getTypePair
    );
  }

  proto method set_data (|)
  { * }

  method set_data (Str $data, :$encoding = 'utf8') {
    samewith( $data.encode($encoding) );
  }
  method set_data (Blob $data) {
    samewith( cast(Pointer, $data) );
  }
  method set_data (CArray[uint8] $data) {
    samewith( cast(Pointer, $data) );
  }
  method set_data (Pointer $data) {
    fluid_preset_set_data($!fs, $data);
  }

}

class Fluid::Sample {
  also does FluidSynth::Roles::Implementor;

  has fluid_sample_t $!fs is implementor;

  method new {
    self.new_fluid_sample;
  }

  method new_fluid_sample {
    new_fluid_sample($!fs);
  }

  method delete_fluid_sample {
    delete_fluid_sample($!fs);
  }

  method cleanup {
    self.delete_fluid_sample;
  }

  method set_loop (Int() $loop_start, Int() $loop_end) {
    my ($ls, $le) = ($loop_start, $loop_end);

    fluid_sample_set_loop($!fs, $ls, $le);
  }

  method set_name (Str() $name) {
    fluid_sample_set_name($!fs, $name);
  }

  method set_pitch (Int() $root_key, Int() $fine_tune) {
    my gint ($r, $f) = ($root_key, $fine_tune);

    fluid_sample_set_pitch($!fs, $r, $f);
  }

  proto method set_sound_data (|)
  { * }

  multi method set_sound_data (
    Int()   $data,
    Str     $data24,
    Int()   $nbframes,
    Int()   $sample_rate,
    Int()   $copy_data,
           :$encoding     = 'utf8'
  ) {
    samewith(
      $data,
      $data24.encode($encoding),
      $nbframes,
      $sample_rate,
      $copy_data
    )
  }
  multi method set_sound_data (
    Int()   $data,
    Blob    $data24,
    Int()   $nbframes,
    Int()   $sample_rate,
    Int()   $copy_data
  ) {
    samewith(
      $data,
      cast(Pointer, $data24),
      $nbframes,
      $sample_rate,
      $copy_data
    )
  multi method set_sound_data (
    Int()         $data,
    CArray[uint8] $data24,
    Int()         $nbframes,
    Int()         $sample_rate,
    Int()         $copy_data
  ) {
    samewith(
      $data,
      cast(Pointer, $data24),
      $nbframes,
      $sample_rate,
      $copy_data
    )
  }
  multi method set_sound_data (
    Int()   $data,
    Pointer $data24,
    Int()   $nbframes,
    Int()   $sample_rate,
    Int()   $copy_data
  ) {
    my gint  ($n, $s) = ($nbframes, $sample_rate);
    my short ($d, $c) = ($data, $copy_data);

    fluid_sample_set_sound_data($!fs, $d, $data24, $n, $s, $c);
  }

  method sizeof {
    fluid_sample_sizeof($!fs);
  }

}

class FluidSynth::SFLoader {
  also does FluidSynth::Roles::Implementor;

  has fluid_sfloader_t $!fl is implementor;

  method new (&free = $DEFAULT-SFONT-FREE) {
    self.new_fluid_sfont(&free);
  }

  method new_fluid_sfloader (&free = $DEFAULT-SFONT-FREE) {
    new_fluid_sfloader($!fs, &free);
  }

  method cleanup {
    self.delete_fluid_sfloader;
  }

  method delete_fluid_sfloader {
    delete_fluid_sfloader($!fl);
  }

  method get_data {
    fluid_sfloader_get_data($!fl);
  }

  method set_callbacks (&open,  &read,  &seek,  &tell,  &close) {
    fluid_sfloader_set_callbacks($!fl, &open, &read,  &seek,  &tell,  &close);
  }

  proto method set_data (|)
  { * }

  multi method set_data (Str $data, :$encoding = 'utf8') {
    samewith( $data.encode($encoding) );
  }
  multi method set_data (Blob $data) {
    samewith( cast(Pointer, $data) );
  }
  multi method set_data (CArray[uint8] $data) {
    samewith( cast(Pointer, $data );
  }
  multi method set_data (Pointer $data) {
    fluid_sfloader_set_data($!fl, $data);
  }

}

class Fluid::SFont {
  also does FluidSynth::Roles::Implementor;

  has fluid_sfont_t $!fs is implementor;

  submethod BUILD ( :$fluid-loader ) {
    $!fs = $fluid-loader;
  }

  multi method new {
    self.new_fluid_defsloader;
  }
  multi method new (
    &get_preset,
    &iter_start,
    &iter_next,
    &free         = $DEFAULT-FREE
  ) {
    self.new_fluid_sfont(&get_preset, &iter_start, &iter_next, &free);
  }

  method new_fluid_defsfloader {
    my $fluid-loader = new_fluid_defsfloader;

    $fluid-loader ?? self.bless( :$fluid-loader ) !! Nil;
  }

  method new_fluid_sfont (
    &get_preset,
    &iter_start,
    &iter_next,
    &free         = $DEFAULT-FREE
  ) {
    my $fluid-loader = new_fluid_sfont(
      &get_preset,
      &iter_start,
      &iter_next,
      &free
    );

    $fluid-loader ?? self.bless( :$fluid-loader ) !! Nil;
  }

  method delete_fluid_sfont {
    delete_fluid_sfont($!fl);
  }

  method cleanup {
    self.delete_fluid_sfont;
  }

  # cw: This should become a sub.
  method get_data (
    :$str            = False,
    :$buf            = False,
    :$blob           = False,
    :array(:$carray) = False,
    :$encoding       = 'utf8'
  {
    my $data = fluid_sfont_get_data($!fs);

    return $data unless $str || $buf || $blob || $carray;

    $data = cast(CArray[uint8], $data);
    return $data if $carray;

    $data = Buf.new($data)
    return $data if $buf;

    return $data.Blob if $blob;

    $data.decode($encoding);
  }

  method get_id {
    fluid_sfont_get_id($!fs);
  }

  method get_name {
    fluid_sfont_get_name($!fs);
  }

  method get_preset (Int() $bank, Int() $prenum, :$raw = False) {
    my gint ($b, $p) = ($bank, $prenum);

    propReturnObject(
      fluid_sfont_get_preset($!fs, $bank, $prenum),
      $raw,
      |FluidSynth::Preset.getTypePair
    );
  }

  method iteration_next {
    fluid_sfont_iteration_next($!fs);
  }

  method iteration_start {
    fluid_sfont_iteration_start($!fs);
  }


  proto method set_data (|)
  { * }

  multi method set_data (Str $data, :$encoding = 'utf8') {
    samewith( $data.encode($encoding);
  }
  multi method set_data (Blob $data) {
    samewith( cast(Pointer, $data) )
  }
  multi method set_data (CArray[uint8] $data) {
    samewith( cast(Pointer, $data) );
  }
  multi method set_data (Pointer $data) {
    fluid_sfont_set_data($!fs, $data);
  }
}
