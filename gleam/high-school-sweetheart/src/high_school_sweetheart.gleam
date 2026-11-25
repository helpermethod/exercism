import gleam/list
import gleam/result
import gleam/string
import gleam/string_tree

pub fn first_letter(name: String) {
  name
  |> string.trim
  |> string.first
  |> result.unwrap("")
}

pub fn initial(name: String) {
  name
  |> first_letter
  |> string.uppercase
  |> string.append(".")
}

pub fn initials(full_name: String) {
  full_name
  |> string.split(" ")
  |> list.map(initial)
  |> string.join(" ")
}

pub fn pair(full_name1: String, full_name2: String) {
  string_tree.from_string("\n")
  |> string_tree.append("     ******       ******\n")
  |> string_tree.append("   **      **   **      **\n")
  |> string_tree.append(" **         ** **         **\n")
  |> string_tree.append("**            *            **\n")
  |> string_tree.append("**                         **\n")
  |> string_tree.append("**     ")
  |> string_tree.append(initials(full_name1))
  |> string_tree.append("  +  ")
  |> string_tree.append(initials(full_name2))
  |> string_tree.append("     **\n")
  |> string_tree.append(" **                       **\n")
  |> string_tree.append("   **                   **\n")
  |> string_tree.append("     **               **\n")
  |> string_tree.append("       **           **\n")
  |> string_tree.append("         **       **\n")
  |> string_tree.append("           **   **\n")
  |> string_tree.append("             ***\n")
  |> string_tree.append("              *\n")
  |> string_tree.to_string()
}
