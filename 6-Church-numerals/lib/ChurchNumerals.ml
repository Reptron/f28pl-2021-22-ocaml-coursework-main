(* Coursework template

   Rohan Samuel, H00335119          <--- confirm who you are 
   F28PL Coursework 2, OCaml        <--- confirm what you're submitting

   You may assume variables and functions defined in earlier questions
   in your answers to later questions, though you should add comments
   in code explaining this if any clarification might help read your
   code.

   To do this coursework, FORK, THEN CLONE the gitlab project.

   If you do it the other way around, then you'll have cloned *my*
   project (which you can't `git push` to), rather than cloned *your
   fork* of the project (which you can `git push` to).

   Any questions, don't guess: ask.

   This coursework is live exam material so KEEP YOUR ANSWERS PRIVATE. *)

(* the data type of Church numerals *)
type church_numeral = (int -> int) -> int -> int

(* i2c i f x = f (f (.... f x)) (where f is applied i times) *)
let rec i2c : int -> church_numeral =
  function
  | 0 -> fun f x -> x                     (*Return x *)
  | i -> fun f x -> f(i2c (i - 1) f x);;  (*The function is applied recursively using i - 1 *)

(* Pass the increment function and 0 into the Church numeral, so that
   every application of f increases the output by 1. As the starting
   point is 0, this will count the number of times f was applied to x,
   thus yielding the integer that the Church numeral represents. *)
let c2i : church_numeral -> int =
  fun c -> c(fun a -> 1 + a) 0;;
