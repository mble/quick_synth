defmodule QuickSynth.Sound do
  def command(note) do
    "play -qn synth 2 pluck #{note}"
  end

  def play(note) do
    note |> command |> String.to_char_list |> :os.cmd
  end
end
