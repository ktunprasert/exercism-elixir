defmodule Newsletter do
  def read_emails(path) do
    File.stream!(path)
    |> Enum.map(&String.trim/1)
  end

  def open_log(path) do
    File.open!(path, [:write])
  end

  def log_sent_email(pid, email) do
    IO.puts(pid, email)
  end

  def close_log(pid) do
    File.close(pid)
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    log_pid = open_log(log_path)

    for email <- read_emails(emails_path) do
      with :ok <- send_fun.(email) do
        log_sent_email(log_pid, email)
      end
    end

    close_log(log_pid)
  end
end
