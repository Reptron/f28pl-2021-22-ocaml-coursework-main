(* Coursework template

   Rohan, H00335119          <--- confirm who you are 
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

(* type declaration for intseq *)
type int_seq = int list

(* implementations *)

(* pointwise addition:

   seq_add [x1; ...; xn] [y1; ...; yn] = [x1 + y1; ...; xn + yn]
 *)
let rec seq_add : int_seq -> int_seq -> int_seq =
  fun xs ys -> match xs, ys with | _, [] -> [] | [],_ -> [] | (*Checks if one of the lists are empty and if it is return empty list *)
  r1::rem1, r2::rem2 ->                                       (*Removes the first number of each lists*)
  ( r1 + r2 ) :: seq_add rem1 rem2;;                          (*Adds the numbers*)

(* pointwise multiplication:

   seq_mult [x1; ...; xn] [y1; ...; yn] = [x1 * y1; ...; xn * yn]
 *)
let rec seq_mult : int_seq -> int_seq -> int_seq =
  fun xs ys ->match xs, ys with | _, [] -> [] | [],_ -> [] | (*Checks if one of the lists are empty and if it is return empty list *)
  r1::s1, r2::s2 ->                                          (*Removes the first number of each lists*)
  ( r1 * r2 ) :: seq_mult s1 s2;;                            (*Multiplies the numbers*)
