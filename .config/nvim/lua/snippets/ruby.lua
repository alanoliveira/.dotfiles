return {
  s("concern", fmt([[
  module {1}
    extend ActiveSupport::Concern

    {2}
  end
    ]], {
    i(1, "ModuleName"),
    i(2) })
  ),
}
