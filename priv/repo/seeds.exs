alias BrambleTest.Repo
alias BrambleTest.Schema.Rating

  Repo.insert! %Rating{
    name: "Jack",
    quantity: 50
  }

  Repo.insert! %Rating{
    name: "Jone",
    quantity: 60
  }

  Repo.insert! %Rating{
    name: "Maria",
    quantity: 100
  }
