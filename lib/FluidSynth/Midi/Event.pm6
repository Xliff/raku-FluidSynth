use v6.c;

use Fluid::Raw::Types;
use Fluid::Raw::Midi;

class FluidSynth::Midi::Event {
  has fluid_midi_event_t $!fme is implementor;

  submethod BUILD ( :$fluid-midi-event ) {
    $!fme = $fluid-midi-event
  }

  multi method new (fluid_midi_event_t $fluid-midi-event) {
    $fluid-midi-event ?? self.bless( :$fluid-midi-event ) !! Nil;
  }
  multi method new {
    self.new_event
  }

  method new_event {
    my $fluid-midi-event = new_fluid_midi_event($!fm);

    $fluid-midi-event ?? self.bless( :$fluid-midi-event ) !! Nil;
  }

  method delete_event {
    delete_fluid_midi_event($!fme);
  }

  method cleanup {
    self.delete_event;
  }

  method get_channel {
    fluid_midi_event_get_channel($!fme);
  }

  method get_control {
    fluid_midi_event_get_control($!fme);
  }

  method get_key {
    fluid_midi_event_get_key($!fme);
  }

  proto method get_lyrics (|)
  { * }

  multi method get_lyrics (CArray[Pointer] $data) {
    samewith($data, $);
  }
  multi method get_lyrics (CArray[Pointer] $data, $size is rw) {
    my gint $s = 0;

    fluid_midi_event_get_lyrics($!fme, $data, $s);
    $size = $s;
  }

  method get_pitch {
    fluid_midi_event_get_pitch($!fme);
  }

  method get_program {
    fluid_midi_event_get_program($!fme);
  }

  proto method get_text (|)
  { * }

  multi method get_text (CArray[Pointer] $data) {
    samewith($data, $);
  }
  multi method get_text (CArray[Pointer] $data, $size is rw) {
    my gint $s = 0;

    fluid_midi_event_get_text($!fme, $data, $s);
    $size = $s;
  }

  method get_type {
    fluid_midi_event_get_type();
  }

  method get_value {
    fluid_midi_event_get_value($!fme);
  }

  method get_velocity {
    fluid_midi_event_get_velocity($!fme);
  }

  method set_channel (Int() $chan) {
    my gint $c = $chan;

    fluid_midi_event_set_channel($!fme, $c);
  }

  method set_control (Int() $ctrl) {
    my gint $c = $ctrl;

    fluid_midi_event_set_control($!fme, $c);
  }

  method set_key (Int() $key) {
    my gint $k = $key;

    fluid_midi_event_set_key($!fme, $k);
  }

  method set_lyrics (Pointer $data, Int() $size, Int() $dynamic) {
    my gint ($s, $d) = ($size, $dynamic);

    fluid_midi_event_set_lyrics($!fme, $data, $s, $d);
  }

  method set_pitch (Int() $val) {
    my gint $v = $val;

    fluid_midi_event_set_pitch($!fme, $v);
  }

  method set_program (Int() $val) {
    my gint $v = $val;

    fluid_midi_event_set_program($!fme, $v);
  }

  method set_sysex (Pointer $data, Int() $size, Int() $dynamic) {
    my gint ($s, $d) = ($size, $dynamic);

    fluid_midi_event_set_sysex($!fme, $data, $s, $d);
  }

  method set_text (Pointer $data, Int() $size, Int() $dynamic) {
    my gint ($s, $d) = ($size, $dynamic);

    fluid_midi_event_set_text($!fme, $data, $s, $d);
  }

  method set_type (Int() $type) {
    my gint $t = $type;

    fluid_midi_event_set_type($!fme, $t);
  }

  method set_value (Int() $val) {
    my gint $v = $val;

    fluid_midi_event_set_value($!fme, $v);
  }

  method set_velocity (Int() $vel) {
    my gint $v = $vel;

    fluid_midi_event_set_velocity($!fme, $v);
  }

}
