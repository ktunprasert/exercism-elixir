defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a1, b1}, {a2, b2}), do: {a1 * b2 + a2 * b1, b1 * b2} |> reduce

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a1, b1}, {a2, b2}), do: {a1 * b2 - a2 * b1, b1 * b2} |> reduce

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1, b1}, {a2, b2}), do: {a1 * a2, b1 * b2} |> reduce

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a1, b1}, {a2, b2}), do: {a1 * b2, a2 * b1} |> reduce

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a1, a2}), do: {a1 |> Kernel.abs(), a2 |> Kernel.abs()} |> reduce

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({a, b}, n) when n > 0, do: {a ** n, b ** n} |> reduce
  def pow_rational({a, b}, m), do: {b ** Kernel.abs(m), a ** Kernel.abs(m)} |> reduce

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a, b}), do: x ** a ** (1 / b)

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({a1, b1}) do
    gcd = Integer.gcd(a1, b1)
    {(a1 / gcd) |> trunc, (b1 / gcd) |> trunc} |> normalise
  end

  defp normalise({a1, b1}) when b1 < 0, do: {-a1, -b1}
  defp normalise({a1, b1}), do: {a1, b1}
end
