Logger.configure(level: :warn)

ExUnit.start()

# Ensure that symlink to custom ecto priv directory exists
source = PowLastLogin.Test.Ecto.Repo.config()[:priv]
target = Application.app_dir(:pow_last_login, source)
File.rm_rf(target)
File.mkdir_p(target)
File.rmdir(target)
:ok = :file.make_symlink(Path.expand(source), target)
Mix.Task.run("ecto.drop", ~w(--quiet -r PowLastLogin.Test.Ecto.Repo))
Mix.Task.run("ecto.create", ~w(--quiet -r PowLastLogin.Test.Ecto.Repo))
Mix.Task.run("ecto.migrate", ~w(--quiet -r PowLastLogin.Test.Ecto.Repo))

{:ok, _pid} = PowLastLogin.Test.Ecto.Repo.start_link()
Ecto.Adapters.SQL.Sandbox.mode(PowLastLogin.Test.Ecto.Repo, :manual)

{:ok, _pid} = PowLastLogin.TestWeb.Phoenix.Endpoint.start_link()
