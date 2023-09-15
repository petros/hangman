defmodule Dictionary.Runtime.Server do
  alias Dictionary.Impl.WordList

  def start_link do
    Agent.start_link(&WordList.word_list/0, name: :wilma)
  end

  def random_word() do
    Agent.get(:wilma, &WordList.random_word/1)
  end
end
