defmodule QuickSynth.Composition do
  def play(timing, notes) do
    for note <- String.graphemes(notes), do: spawn_note(timing, note)
  end

  defp spawn_note(timing, note) do
    spawn(QuickSynth.Sound, :play, [note])
    :timer.sleep(timing)
  end
end
