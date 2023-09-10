defmodule HighSchoolSweetheart do
  def first_letter(name), do: name |> String.trim_leading() |> String.first()

  def initial(name), do: name |> first_letter() |> String.upcase() |> Kernel.<>(".")

  def initials(full_name) do
    [first, last] = String.split(full_name, " ")
    "#{first |> initial} #{last |> initial}"
  end

  def pair(full_name1, full_name2) do
    in1 = full_name1 |> initials
    in2 = full_name2 |> initials

    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{in1}  +  #{in2}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
