defmodule Refer.Accounts do
  use Ash.Api

  resources do
    resource Refer.Accounts.User
    resource Refer.Accounts.Token
  end
end
