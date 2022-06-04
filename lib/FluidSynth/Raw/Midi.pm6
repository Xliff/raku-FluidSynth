use v6.c;

use NativeCall;

use FluidSynth::Raw::Definititions

unit package FluidSynth::Raw::Midi;

### /usr/include/fluidsynth/midi.h

sub delete_fluid_midi_driver (fluid_midi_driver_t $driver)
  is native(fluidsynth)
  is export
{ * }

sub delete_fluid_midi_event (fluid_midi_event_t $event)
  is native(fluidsynth)
  is export
{ * }

sub delete_fluid_player (fluid_player_t $player)
  is native(fluidsynth)
  is export
{ * }

sub delete_fluid_midi_router (fluid_midi_router_t $handler)
  is native(fluidsynth)
  is export
{ * }

sub delete_fluid_midi_router_rule (fluid_midi_router_rule_t $rule)
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_dump_postrouter (Pointer $data, fluid_midi_event_t $event)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_dump_prerouter (Pointer $data, fluid_midi_event_t $event)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_event_get_channel (fluid_midi_event_t $evt)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_event_get_control (fluid_midi_event_t $evt)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_event_get_key (fluid_midi_event_t $evt)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_event_get_lyrics (
  fluid_midi_event_t $evt,
  CArray[Pointer]    $data,
  gint               $size  is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_event_get_pitch (fluid_midi_event_t $evt)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_event_get_program (fluid_midi_event_t $evt)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_event_get_text (
  fluid_midi_event_t $evt,
  CArray[Pointer]    $data,
  gint               $size  is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_event_get_type (fluid_midi_event_t $evt)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_event_get_value (fluid_midi_event_t $evt)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_event_get_velocity (fluid_midi_event_t $evt)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_event_set_channel (fluid_midi_event_t $evt, gint $chan)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_event_set_control (fluid_midi_event_t $evt, gint $ctrl)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_event_set_key (fluid_midi_event_t $evt, gint $key)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_event_set_lyrics (
  fluid_midi_event_t $evt,
  Pointer            $data,
  gint               $size,
  gint               $dynamic
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_event_set_pitch (fluid_midi_event_t $evt, gint $val)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_event_set_program (fluid_midi_event_t $evt, gint $val)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_event_set_sysex (
  fluid_midi_event_t $evt,
  Pointer            $data,
  gint               $size,
  gint               $dynamic
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_event_set_text (
  fluid_midi_event_t $evt,
  Pointer            $data,
  gint               $size,
  gint               $dynamic
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_event_set_type (fluid_midi_event_t $evt, gint $type)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_event_set_value (fluid_midi_event_t $evt, gint $val)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_event_set_velocity (fluid_midi_event_t $evt, gint $vel)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_player_add (fluid_player_t $player, Str $midifile)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_player_add_mem (
  fluid_player_t $player,
  Pointer        $buffer,
  size_t         $len
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_player_get_bpm (fluid_player_t $player)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_player_get_current_tick (fluid_player_t $player)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_player_get_midi_tempo (fluid_player_t $player)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_player_get_status (fluid_player_t $player)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_player_get_total_ticks (fluid_player_t $player)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_player_join (fluid_player_t $player)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_player_play (fluid_player_t $player)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_player_seek (fluid_player_t $player, gint $ticks)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_player_set_bpm (fluid_player_t $player, gint $bpm)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_player_set_loop (fluid_player_t $player, gint $loop)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_player_set_midi_tempo (fluid_player_t $player, gint $tempo)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_player_set_playback_callback (
  fluid_player_t $player,
  &handler (Pointer, fluid_midi_event_t --> gint), #= handle_midi_event_func_t
  Pointer $handler_data
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_player_set_tempo (
  fluid_player_t $player,
  gint           $tempo_type,
  gdouble        $tempo
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_player_set_tick_callback (
  fluid_player_t $player,
                 &handler (Pointer, gint --> gint),
  Pointer        $handler_data
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_player_stop (fluid_player_t $player)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub new_fluid_midi_driver (
  fluid_settings_t $settings,
                   &handler (Pointer, fluid_midi_event_t --> gint),
  Pointer          $event_handler_data
)
  returns fluid_midi_driver_t
  is native(fluidsynth)
  is export
{ * }

sub new_fluid_midi_event ()
  returns fluid_midi_event_t
  is native(fluidsynth)
  is export
{ * }

sub new_fluid_player (fluid_synth_t $synth)
  returns fluid_player_t
  is native(fluidsynth)
  is export
{ * }

sub new_fluid_midi_router (
  fluid_settings_t $settings,
                   &handler (Pointer, fluid_midi_event_t --> gint),
  Pointer          $event_handler_data
)
  returns fluid_midi_router_t
  is native(fluidsynth)
  is export
{ * }

sub new_fluid_midi_router_rule ()
  returns fluid_midi_router_rule_t
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_router_add_rule (
  fluid_midi_router_t      $router,
  fluid_midi_router_rule_t $rule,
  gint                     $type
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_router_clear_rules (fluid_midi_router_t $router)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_router_handle_midi_event (
  CArray[uint8]      $data,
  fluid_midi_event_t $event
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_router_rule_set_chan (
  fluid_midi_router_rule_t $rule,
  gint                     $min,
  gint                     $max,
  gfloat                   $mul,
  gint                     $add
)
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_router_rule_set_param1 (
  fluid_midi_router_rule_t $rule,
  gint                     $min,
  gint                     $max,
  gfloat                   $mul,
  gint                     $add
)
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_router_rule_set_param2 (
  fluid_midi_router_rule_t $rule,
  gint                     $min,
  gint                     $max,
  gfloat                   $mul,
  gint                     $add
)
  is native(fluidsynth)
  is export
{ * }

sub fluid_midi_router_set_default_rules (fluid_midi_router_t $router)
  returns gint
  is native(fluidsynth)
  is export
{ * }
