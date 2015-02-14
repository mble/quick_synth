defmodule QuickSynth.SoundTest do
  use ExUnit.Case
  alias QuickSynth.Sound

  test "outputs the appropriate command to play a C note" do
    assert Sound.command("C") == "play -qn synth 2 pluck C"
  end
end
