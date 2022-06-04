use v6.c;

use NativeCall;

use FluidSynth::Raw::Types;
use FluidSynth::Raw::Midi;

class FluidSynth::Player {
  has fluid_player_t $!fp is implementor;

  submethod BUILD ( :$fluid-player ) {
    $!fp = $fluid-player;
  }

  method FluidSynth::Raw::Definitions::fluid_player_t
  { $!fp }

  multi method new (fluid_player_t $fluid-player) {
    $fluid-player ?? self.bless( :$fluid-player ) !! Nil;
  }
  multi method new {
    self.new_fluid_player
  }

  method new_fluid_player {
    my $fluid-player = new_fluid_player($!fm);

    $fluid-player ?? self.bless( :$fluid-player ) !! Nil;
  }

  method add (Str() $midifile) {
    fluid_player_add($!fp, $midifile);
  }

  method add_mem (Pointer $buffer, Int() $len) {
    my size_t $l = $len

    fluid_player_add_mem($!fp, $buffer, $l);
  }

  method delete_fluid_player {
    delete_fluid_player($!fm);
  }

  method cleanup {
    self.delete_fluid_player;
  }

  method get_bpm {
    fluid_player_get_bpm($!fp);
  }

  method get_current_tick {
    fluid_player_get_current_tick($!fp);
  }

  method get_midi_tempo {
    fluid_player_get_midi_tempo($!fp);
  }

  method get_status {
    fluid_player_get_status($!fp);
  }

  method get_total_ticks {
    fluid_player_get_total_ticks($!fp);
  }

  method join {
    fluid_player_join($!fp);
  }

  method play {
    fluid_player_play($!fp);
  }

  method seek (Int() $ticks) {
    my gint $t = $ticks;

    fluid_player_seek($!fp, $t);
  }

  method set_bpm (Int() $bpm) {
    my gint $b = $bpm;

    fluid_player_set_bpm($!fp, $b);
  }

  method set_loop (Int() $loop) {
    my gint $l = $loop;

    fluid_player_set_loop($!fp, $l);
  }

  method set_midi_tempo (Int() $tempo) {
    my gint $t = $tempo;

    fluid_player_set_midi_tempo($!fp, $t);
  }

  method set_playback_callback (&handler, Pointer $handler_data = gpointer) {
    fluid_player_set_playback_callback($!fp, $handler, $handler_data);
  }

  method set_tempo (Int() $tempo_type, Num() $tempo) {
    my gint    $t  = $tempo_type;
    my gdouble $tt = $tempo;

    fluid_player_set_tempo($!fp, $t, $tt);
  }

  method set_tick_callback (&handler, Pointer $handler_data = gpointer) {
    fluid_player_set_tick_callback($!fp, $handler, $handler_data);
  }

  method stop {
    fluid_player_stop($!fp);
  }

}
