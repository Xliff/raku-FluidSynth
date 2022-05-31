use v6;

use FluidSynth::Raw::Types;

use FluidSynth::Audio;
use FluidSynth::Sequencer;
use FluidSynth::Settings;
use FluidSynth::Synth;

sub MAIN {
  die 'Failed to create the settings!'
    unless (my $settings = FluidSynth::Settings.new);

  die 'Failed to create the synth!'
    unless ( my $synth = FluidSynth::Synth.new($settings) );

  my $sfont = 'example.sf2';
  $sfont = "examples/{ $sfont }" unless $sfont.IO.e;
  #my $sfont = '/usr/share/sounds/sf2/FluidR3_GM.sf2';
  die "Loading the SoundFont '{ $sfont }', failed!"
    if ( my $sfid = $synth.sfload($sfont, 1) ) == FLUID_FAILED;

  die 'Failed to create the audio driver!'
    unless ( my $adriver  = FluidSynth::Audio.new($settings, $synth) );

  LAST {
    .cleanup for $adriver, $synth, $settings;
  }

  for ^12 {
    my $note = 60 + (^12).pick;

    $synth.noteon(0, $note, 80);
    sleep 1;
    $synth.noteoff(0, $note);
  }

}
