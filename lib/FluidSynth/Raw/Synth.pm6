use v6.c;

use NativeCall;

use FluidSynth::Raw::Definitions;

unit package FluidSynth::Raw::Synth;

### /usr/include/fluidsynth/synth.h

sub fluid_synth_activate_key_tuning (
  fluid_synth_t   $synth,
  gint            $bank,
  gint            $prog,
  Str             $name,
  CArray[gdouble] $pitch, #= Length 128
  gint            $apply
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_activate_octave_tuning (
  fluid_synth_t $synth,
  gint          $bank,
  gint          $prog,
  Str           $name,
  gdouble       $pitch   is rw,
  gint          $apply
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_activate_tuning (
  fluid_synth_t $synth,
  gint          $chan,
  gint          $bank,
  gint          $prog,
  gint          $apply
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_add_default_mod (
  fluid_synth_t $synth,
  fluid_mod_t   $mod,
  gint          $mode
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_add_sfloader (fluid_synth_t $synth, fluid_sfloader_t $loader)
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_add_sfont (fluid_synth_t $synth, fluid_sfont_t $sfont)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_all_notes_off (fluid_synth_t $synth, gint $chan)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_all_sounds_off (fluid_synth_t $synth, gint $chan)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_alloc_voice (
  fluid_synth_t  $synth,
  fluid_sample_t $sample,
  gint           $channum,
  gint           $key,
  gint           $vel
)
  returns fluid_voice_t
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_bank_select (fluid_synth_t $synth, gint $chan, gint $bank)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_cc (fluid_synth_t $synth, gint $chan, gint $ctrl, gint $val)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_channel_pressure (fluid_synth_t $synth, gint $chan, gint $val)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_chorus_on (fluid_synth_t $synth, gint $fx_group, gint $on)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_count_audio_channels (fluid_synth_t $synth)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_count_audio_groups (fluid_synth_t $synth)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_count_effects_channels (fluid_synth_t $synth)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_count_effects_groups (fluid_synth_t $synth)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_count_midi_channels (fluid_synth_t $synth)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_deactivate_tuning (
  fluid_synth_t $synth,
  gint          $chan,
  gint          $apply
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub delete_fluid_synth (fluid_synth_t $synth)
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_error (fluid_synth_t $synth)
  returns Str
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_active_voice_count (fluid_synth_t $synth)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_bank_offset (fluid_synth_t $synth, gint $sfont_id)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_basic_channel (
  fluid_synth_t $synth,
  gint          $chan,
  gint          $basic_chan_out is rw,
  gint          $mode_chan_out  is rw,
  gint          $basic_val_out  is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_breath_mode (
  fluid_synth_t $synth,
  gint          $chan,
  gint          $breathmode is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_cc (
  fluid_synth_t $synth,
  gint          $chan,
  gint          $ctrl,
  gint          $pval   is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_channel_preset (fluid_synth_t $synth, gint $chan)
  returns fluid_preset_t
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_chorus_depth (fluid_synth_t $synth)
  returns gdouble
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_chorus_group_depth (
  fluid_synth_t $synth,
  gint    $fx_group,
  gdouble $depth_ms           is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_chorus_group_level (
  fluid_synth_t $synth,
  gint          $fx_group,
  gdouble       $level        is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_chorus_group_nr (
  fluid_synth_t $synth,
  gint          $fx_group,
  gint          $nr           is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_chorus_group_speed (
  fluid_synth_t $synth,
  gint          $fx_group,
  gdouble       $speed     is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_chorus_group_type (
  fluid_synth_t $synth,
  gint          $fx_group,
  gint          $type         is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_chorus_level (fluid_synth_t $synth)
  returns gdouble
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_chorus_nr (fluid_synth_t $synth)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_chorus_speed (fluid_synth_t $synth)
  returns gdouble
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_chorus_type (fluid_synth_t $synth)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_cpu_load (fluid_synth_t $synth)
  returns gdouble
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_gain (fluid_synth_t $synth)
  returns gfloat
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_gen (fluid_synth_t $synth, gint $chan, gint $param)
  returns gfloat
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_internal_bufsize (fluid_synth_t $synth)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_ladspa_fx (fluid_synth_t $synth)
  returns fluid_ladspa_fx_t
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_legato_mode (
  fluid_synth_t $synth,
  gint          $chan,
  gint          $legatomode is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_pitch_bend (
  fluid_synth_t $synth,
  gint          $chan,
  gint          $ppitch_bend is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_pitch_wheel_sens (
  fluid_synth_t $synth,
  gint          $chan,
  gint          $pval is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_polyphony (fluid_synth_t $synth)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_portamento_mode (
  fluid_synth_t $synth,
  gint          $chan,
  gint          $portamentomode is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_program (
  fluid_synth_t $synth,
  gint          $chan,
  gint          $sfont_id   is rw,
  gint          $bank_num   is rw,
  gint          $preset_num is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_reverb_damp (fluid_synth_t $synth)
  returns gdouble
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_reverb_group_damp (
  fluid_synth_t $synth,
  gint          $fx_group,
  gdouble       $damping   is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_reverb_group_level (
  fluid_synth_t $synth,
  gint          $fx_group,
  gdouble       $level     is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_reverb_group_roomsize (
  fluid_synth_t $synth,
  gint          $fx_group,
  gdouble       $roomsize is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_reverb_group_width (
  fluid_synth_t $synth,
  gint          $fx_group,
  gdouble       $width     is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_reverb_level (fluid_synth_t $synth)
  returns gdouble
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_reverb_roomsize (fluid_synth_t $synth)
  returns gdouble
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_reverb_width (fluid_synth_t $synth)
  returns gdouble
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_settings (fluid_synth_t $synth)
  returns fluid_settings_t
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_sfont (fluid_synth_t $synth, gint $num)
  returns fluid_sfont_t
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_sfont_by_id (fluid_synth_t $synth, gint $id)
  returns fluid_sfont_t
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_sfont_by_name (fluid_synth_t $synth, Str $name)
  returns fluid_sfont_t
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_get_voicelist (
  fluid_synth_t $synth,
  fluid_voice_t $buf,
  gint          $bufsize,
  gint          $ID
)
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_handle_midi_event (Pointer $data, fluid_midi_event_t $event)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_key_pressure (
  fluid_synth_t $synth,
  gint          $chan,
  gint          $key,
  gint          $val
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub new_fluid_synth (fluid_settings_t $settings)
  returns fluid_synth_t
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_noteoff (fluid_synth_t $synth, gint $chan, gint $key)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_noteon (fluid_synth_t $synth, gint $chan, gint $key, gint $vel)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_nwrite_float (
  fluid_synth_t  $synth,
  gint           $len,
  CArray[gfloat] $left,
  CArray[gfloat] $right,
  CArray[gfloat] $fx_left,
  CArray[gfloat] $fx_right
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_pin_preset (
  fluid_synth_t $synth,
  gint          $sfont_id,
  gint          $bank_num,
  gint          $preset_num
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_pitch_bend (fluid_synth_t $synth, gint $chan, gint $val)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_pitch_wheel_sens (fluid_synth_t $synth, gint $chan, gint $val)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_process (
  fluid_synth_t $synth,
  gint          $len,
  gint          $nfx,
  gfloat        $fx     is rw,
  gint          $nout,
  gfloat        $out    is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_program_change (
  fluid_synth_t $synth,
  gint          $chan,
  gint          $program
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_program_reset (fluid_synth_t $synth)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_program_select (
  fluid_synth_t $synth,
  gint          $chan,
  gint          $sfont_id,
  gint          $bank_num,
  gint          $preset_num
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_program_select_by_sfont_name (
  fluid_synth_t $synth,
  gint          $chan,
  Str           $sfont_name,
  gint          $bank_num,
  gint          $preset_num
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_remove_default_mod (fluid_synth_t $synth, fluid_mod_t $mod)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_remove_sfont (fluid_synth_t $synth, fluid_sfont_t $sfont)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_reset_basic_channel (fluid_synth_t $synth, gint $chan)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_reverb_on (fluid_synth_t $synth, gint $fx_group, gint $on)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_bank_offset (
  fluid_synth_t $synth,
  gint          $sfont_id,
  gint          $offset
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_basic_channel (
  fluid_synth_t $synth,
  gint          $chan,
  gint          $mode,
  gint          $val
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_breath_mode (
  fluid_synth_t $synth,
  gint          $chan,
  gint          $breathmode
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_channel_type (fluid_synth_t $synth, gint $chan, gint $type)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_chorus (
  fluid_synth_t $synth,
  gint          $nr,
  gdouble       $level,
  gdouble       $speed,
  gdouble       $depth_ms,
  gint          $type
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_chorus_depth (fluid_synth_t $synth, gdouble $depth_ms)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_chorus_group_depth (
  fluid_synth_t $synth,
  gint          $fx_group,
  gdouble       $depth_ms
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_chorus_group_level (
  fluid_synth_t $synth,
  gint          $fx_group,
  gdouble       $level
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_chorus_group_nr (
  fluid_synth_t $synth,
  gint          $fx_group,
  gint          $nr
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_chorus_group_speed (
  fluid_synth_t $synth,
  gint          $fx_group,
  gdouble       $speed
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_chorus_group_type (
  fluid_synth_t $synth,
  gint          $fx_group,
  gint          $type
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_chorus_level (fluid_synth_t $synth, gdouble $level)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_chorus_nr (fluid_synth_t $synth, gint $nr)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_chorus_on (fluid_synth_t $synth, gint $on)
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_chorus_speed (fluid_synth_t $synth, gdouble $speed)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_chorus_type (fluid_synth_t $synth, gint $type)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_custom_filter (fluid_synth_t $type, gint $flags)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_gain (fluid_synth_t $synth, gfloat $gain)
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_gen (
  fluid_synth_t $synth,
  gint          $chan,
  gint          $param,
  gfloat        $value
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_interp_method (
  fluid_synth_t $synth,
  gint          $chan,
  gint          $interp_method
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_legato_mode (
  fluid_synth_t $synth,
  gint          $chan,
  gint          $legatomode
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_polyphony (fluid_synth_t $synth, gint $polyphony)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_portamento_mode (
  fluid_synth_t $synth,
  gint          $chan,
  gint          $portamentomode
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_reverb (
  fluid_synth_t $synth,
  gdouble       $roomsize,
  gdouble       $damping,
  gdouble       $width,
  gdouble       $level
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_reverb_damp (fluid_synth_t $synth, gdouble $damping)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_reverb_group_damp (
  fluid_synth_t $synth,
  gint          $fx_group,
  gdouble       $damping
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_reverb_group_level (
  fluid_synth_t $synth,
  gint          $fx_group,
  gdouble       $level
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_reverb_group_roomsize (
  fluid_synth_t $synth,
  gint          $fx_group,
  gdouble       $roomsize
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_reverb_group_width (
  fluid_synth_t $synth,
  gint          $fx_group,
  gdouble       $width
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_reverb_level (fluid_synth_t $synth, gdouble $level)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_reverb_on (fluid_synth_t $synth, gint $on)
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_reverb_roomsize (fluid_synth_t $synth, gdouble $roomsize)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_reverb_width (fluid_synth_t $synth, gdouble $width)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_set_sample_rate (fluid_synth_t $synth, gfloat $sample_rate)
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_sfcount (fluid_synth_t $synth)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_sfload (
  fluid_synth_t $synth,
  Str           $filename,
  gint          $reset_presets
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_sfont_select (fluid_synth_t $synth, gint $chan, gint $sfont_id)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_sfreload (fluid_synth_t $synth, gint $id)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_sfunload (fluid_synth_t $synth, gint $id, gint $reset_presets)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_start (
  fluid_synth_t  $synth,
  gint           $id,
  fluid_preset_t $preset,
  gint           $audio_chan,
  gint           $midi_chan,
  gint           $key,
  gint           $vel
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_start_voice (fluid_synth_t $synth, fluid_voice_t $voice)
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_stop (fluid_synth_t $synth, gint $id)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_sysex (
  fluid_synth_t $synth,
  CArray[uint8] $data,
  gint          $len,
  Str           $response,
  gint          $response_len is rw,
  gint          $handled      is rw,
  gint          $dryrun
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_system_reset (fluid_synth_t $synth)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_tune_notes (
  fluid_synth_t $synth,
  gint          $bank,
  gint          $prog,
  gint          $len,
  gint          $keys   is rw,
  gdouble       $pitch  is rw,
  gint          $apply
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_tuning_dump (
  fluid_synth_t   $synth,
  gint            $bank,
  gint            $prog,
  Str             $name,
  gint            $len,    #= Name length
  CArray[gdouble] $pitch   #= 128 entries
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_tuning_iteration_next (
  fluid_synth_t $synth,
  gint          $bank   is rw,
  gint          $prog   is rw
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_tuning_iteration_start (fluid_synth_t $synth)
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_unpin_preset (
  fluid_synth_t $synth,
  gint          $sfont_id,
  gint          $bank_num,
  gint          $preset_num
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_unset_program (fluid_synth_t $synth, gint $chan)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_write_float (
  fluid_synth_t $synth,
  gint          $len,
  Pointer       $lout,
  gint          $loff,
  gint          $lincr,
  Pointer       $rout,
  gint          $roff,
  gint          $rincr
)
  returns gint
  is native(fluidsynth)
  is export
{ * }

sub fluid_synth_write_s16 (
  fluid_synth_t $synth,
  gint          $len,
  Pointer       $lout,
  gint          $loff,
  gint          $lincr,
  Pointer       $rout,
  gint          $roff,
  gint          $rincr
)
  returns gint
  is native(fluidsynth)
  is export
{ * }
