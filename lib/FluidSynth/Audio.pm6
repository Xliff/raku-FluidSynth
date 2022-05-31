use v6.c;

use NativeCall;

use FluidSynth::Raw::Types;
use FluidSynth::Raw::Audio;

class FluidSynth::Audio {

  method new (
    fluid_settings_t() $settings,
    fluid_synth_t()    $synth
  ) {
    self.new_fluid_audio_driver($settings, $synth);
  }

  method new_fluid_audio_driver (
    fluid_settings_t() $settings,
    fluid_synth_t()    $synth
  ) {
    new_fluid_audio_driver($settings, $synth);
  }

  method new_fluid_audio_driver2 (
    fluid_settings_t $settings,
                     &func,
    gpointer         $data
  ) {
    new_fluid_audio_driver2($settings, &func, $data);
  }

  method delete_fluid_audio_driver (fluid_audio_driver_t $driver) {
    delete_fluid_audio_driver($driver);
  }

  method cleanup {
    self.delete_fluid_audio_driver
  }

  # === CW: Suspect these will find their way into other classes.

  method delete_fluid_file_renderer (fluid_file_renderer_t $dev) {
    delete_fluid_file_renderer($dev);
  }

  method fluid_audio_driver_register (CArray[Str] $adrivers) {
    fluid_audio_driver_register($adrivers);
  }

  method fluid_file_renderer_process_block (fluid_file_renderer_t $dev) {
    fluid_file_renderer_process_block($dev);
  }

  method fluid_file_set_encoding_quality (
    fluid_file_renderer_t $dev,
    gdouble               $q
  ) {
    fluid_file_set_encoding_quality($dev, $q);
  }

  method new_fluid_file_renderer (fluid_synth_t $synth) {
    new_fluid_file_renderer($synth);
  }

}
