pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  pizza_price_loop(pizza, 0)
}

fn pizza_price_loop(pizza: Pizza, acc: Int) -> Int {
  case pizza {
    Margherita -> acc + 7
    Caprese -> acc + 9
    Formaggio -> acc + 10
    ExtraSauce(p) -> pizza_price_loop(p, acc + 1)
    ExtraToppings(p) -> pizza_price_loop(p, acc + 2)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  order_price_loop(
    order,
    case order {
      [_] -> 3
      [_, _] -> 2
      _ -> 0
    }
  )
}

fn order_price_loop(order: List(Pizza), acc: Int) {
  case order {
    [] -> acc
    [pizza, ..rest] -> order_price_loop(rest, acc + pizza_price(pizza))
  }
}
