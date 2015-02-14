defmodule QuickSynth.UI do
  alias QuickSynth.Sound
  alias QuickSynth.KeyboardMap

  def start do
    window = create_window(200, 100)
    loop(window)
  end

  defp create_window(width, height) do
    gs_server = :gs.start()
    :gs.create(:window, gs_server, [width: width, height: height, keypress: true, map: true])
  end

  defp loop(window) do
    receive do
      {:gs, ^window, :keypress, data, args} ->
        key = hd(args)
        note = KeyboardMap.note_for("#{key}")
        case note do
          :nomap -> :ok
          _ -> spawn(Sound, :play, [note])
        end
    end
    loop(window)
  end
end
