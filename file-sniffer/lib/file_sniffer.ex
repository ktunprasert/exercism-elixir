defmodule FileSniffer do
  @mime %{
    "exe" => "application/octet-stream",
    "bmp" => "image/bmp",
    "png" => "image/png",
    "jpg" => "image/jpg",
    "gif" => "image/gif"
  }

  @bytes_exe <<0x7F, 0x45, 0x4C, 0x46>>
  @bytes_bmp <<0x42, 0x4D>>
  @bytes_png <<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A>>
  @bytes_jpg <<0xFF, 0xD8, 0xFF>>
  @bytes_gif <<0x47, 0x49, 0x46>>

  def type_from_extension(extension) do
    @mime[extension]
  end

  def type_from_binary(<<@bytes_exe, _::binary>>), do: "application/octet-stream"
  def type_from_binary(<<@bytes_bmp, _::binary>>), do: "image/bmp"
  def type_from_binary(<<@bytes_png, _::binary>>), do: "image/png"
  def type_from_binary(<<@bytes_jpg, _::binary>>), do: "image/jpg"
  def type_from_binary(<<@bytes_gif, _::binary>>), do: "image/gif"
  def type_from_binary(_), do: nil

  def verify(file_binary, extension) do
    do_verify(type_from_binary(file_binary), type_from_extension(extension))
  end

  defp do_verify(type, type) when type !== nil, do: {:ok, type}
  defp do_verify(_, _), do: {:error, "Warning, file format and file extension do not match."}
end
