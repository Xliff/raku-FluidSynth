use v6.c;

use NativeCall;

use FluidSynth::Raw::Definitions;

unit package FluidSynth::Raw::Event;

### /usr/include/fluidsynth/event.h

sub fluid_event_all_notes_off (fluid_event_t $evt, gint $channel)
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_all_sounds_off (fluid_event_t $evt, gint $channel)
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_bank_select (
  fluid_event_t $evt,
  gint          $channel,
  short         $bank_num
)
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_channel_pressure (fluid_event_t $evt, gint $channel, gint $val)
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_chorus_send (fluid_event_t $evt, gint $channel, gint $val)
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_control_change (
  fluid_event_t $evt,
  gint          $channel,
  short         $control,
  gint          $val
)
  is native(fluidsynth)
  is export
{ * }

sub delete_fluid_event (fluid_event_t $evt)
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_get_bank (fluid_event_t $evt)
  returns short
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_get_channel (fluid_event_t $evt)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_get_control (fluid_event_t $evt)
  returns short
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_get_data (fluid_event_t $evt)
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_get_dest (fluid_event_t $evt)
  returns fluid_seq_id_t
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_get_duration (fluid_event_t $evt)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_get_key (fluid_event_t $evt)
  returns short
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_get_pitch (fluid_event_t $evt)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_get_program (fluid_event_t $evt)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_get_scale (fluid_event_t $evt)
  returns gdouble
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_get_sfont_id (fluid_event_t $evt)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_get_source (fluid_event_t $evt)
  returns fluid_seq_id_t
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_get_type (fluid_event_t $evt)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_get_value (fluid_event_t $evt)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_get_velocity (fluid_event_t $evt)
  returns short
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_key_pressure (
  fluid_event_t $evt,
  gint          $channel,
  short         $key,
  gint          $val
)
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_modulation (fluid_event_t $evt, gint $channel, gint $val)
  is native(fluidsynth)
  is export
{ * }

sub new_fluid_event ()
  returns fluid_event_t
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_note (
  fluid_event_t $evt,
  gint          $channel,
  short         $key,
  short         $vel,
  gint          $duration
)
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_noteoff (fluid_event_t $evt, gint $channel, short $key)
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_noteon (
  fluid_event_t $evt,
  gint          $channel,
  short         $key,
  short         $vel
)
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_pan (fluid_event_t $evt, gint $channel, gint $val)
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_pitch_bend (fluid_event_t $evt, gint $channel, gint $val)
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_pitch_wheelsens (fluid_event_t $evt, gint $channel, gint $val)
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_program_change (
  fluid_event_t $evt,
  gint          $channel,
  gint          $preset_num
)
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_program_select (
  fluid_event_t $evt,
  gint          $channel,
  gint          $sfont_id,
  short         $bank_num,
  short         $preset_num
)
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_reverb_send (fluid_event_t $evt, gint $channel, gint $val)
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_scale (fluid_event_t $evt, gdouble $new_scale)
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_set_dest (fluid_event_t $evt, fluid_seq_id_t $dest)
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_set_source (fluid_event_t $evt, fluid_seq_id_t $src)
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_sustain (fluid_event_t $evt, gint $channel, gint $val)
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_system_reset (fluid_event_t $evt)
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_timer (fluid_event_t $evt, Pointer $data)
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_unregistering (fluid_event_t $evt)
  is native(fluidsynth)
  is export
{ * }

sub fluid_event_volume (fluid_event_t $evt, gint $channel, gint $val)
  is native(fluidsynth)
  is export
{ * }
