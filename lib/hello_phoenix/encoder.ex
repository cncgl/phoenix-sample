defimpl Poison.Encoder, for: HelloPhoenix.Todo do

  def encode(struct, options) do
    map = struct
         |> Map.from_struct
         |> sanitize_map
    Poison.Encoder.Map.encode(map, options)
  end

  defp sanitize_map(map) do
    Map.drop(map, [:__meta__, :__struct__])
  end
end
