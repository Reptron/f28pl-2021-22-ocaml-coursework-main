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

(* type aliases for integer sequences and integer matrices *)
type int_seq = int list
type int_matrix = int_seq list

(* useful for debugging *)
let string_of_row row =
  String.concat ""
    (List.map (fun x -> string_of_int x ^ " ") row)

(* useful for debugging *)
let rec string_of_matrix m =
  match m with
      | []            -> ""
      | [[]]          -> ""
      | (row :: rest) ->
         string_of_row row ^ "\n" ^
         string_of_matrix rest

let body_of_matrix x = x;;

(*Retrieves the length of each row of a matrix*)
let rec length_of_row : 'a list -> int =
fun x -> match x with [] -> 0 | (x :: rem) -> length_of_row rem + 1;;

(* test whether a list of lists of integers represents a matrix.  The
   length of each row should be equal.*)
let is_matrix x =
  let rec matrix_rec : int list list -> bool =                                               (*Function to help implement recursion *)
  fun x -> match x with                                                                      (*Pattern Matching *)
  [] -> true |                                                                               (*If list is empty return true *)
  [[]] -> true |                                                                             (*If matrrix is empty return true *)
  a :: [] -> true |                                                                          (*If there is a list at the top and the remaining is empty return true *)
  a :: b :: c -> if (length_of_row a == length_of_row b) then matrix_rec (b :: c) else false (*If the top row and the next row are equal then it checks if the other rows have the same length but if they are not equal then return false *)
  
  in matrix_rec x;;                                                                          (* *)

(* function matrixshape takes the matrix, and calculates the number of
   columns and rows *)
let matrix_shape x =
  match x with                                     (*Pattern Matching *)
  [] -> (0,0) |                                    (*If the list empty it will return (0,0) *)
  [[]] -> (0,1) |                                  (*If the matrix empty it will return (0,1) -> zero columns and 1 row *)
  (x :: y) -> (length_of_row x, length_of_row + 1) (*If matrix is not empty it will return the number of columns and rows present *)

(*This function helps to add the rows of a matrix *)
let rec addseq : int_seq -> int_seq -> int_seq =
fun x y -> match x, y with |                       (*Pattern Matching *)
(*If one of the lists are empty then it returns an empty list *)
_, [] -> [] |
[], _ -> [] |
(a1 :: x, a2 :: y) -> (a1 + a2) :: (addseq x y);;  (*The heads of each row are added and then it is recursively called adding the heads of the remaining lists*)

(*This function helps find the product of the rows of a matrix *)
let rec multiplyseq : int_seq -> int_seq -> int_seq =
fun x y -> match x, y with |                           (*Pattern Matching *)
(*If one of the lists are empty then it returns an empty list *)
_, [] -> [] |
[], _ -> [] |
(m1 :: x, m2 :: y) -> (m1 * m2) :: (multiplyseq x y);; (*The heads of each row are multiplied and then it is recursively called mulyiplying the heads of the remaining lists*)


(* matrix addition *)
let rec matrix_add x y = 
match x, y with                                            (*Pattern Matching *)
[], [] -> [] |                                             (*When 2 lists are added it returns an empty list *)
[[]], [[]] -> [[]] |                                       (*When 2 matrices are added it returns an empty matrix *)
(x :: b), (y :: b2) -> (addseq x y) :: ((matrix_add b b2)) (*The heads of both matrices are added when addseq is called and the tails are being used to call both matrices recusively *)

(*This function add all the values in int_seq *)
let rec add_int_seq : int_seq -> int =
fun x -> match x with                                      (*Pattern Matching *)
[] -> 0 |                                                  (*If list is empty then return 0  *)
(t :: b) -> t + add_int_seq b;;                            (*If not empty then add the head of the list with the remaining head and after that is done call recursively and repeat *)

exception ListError of string;;

let top (z : 'a list) : 'a =
match z with
[] -> raise (ListError "No head") |
(x :: rem) -> rem;;

let bot (z : 'a list) : 'a =
match z with
[] -> raise (ListError "No tail") |
(x :: rem) -> rem;;

let rec interchange : int_seq list -> int_seq list =
fun z -> match z with
[] -> [] |
[] :: _ -> [] |
z_row -> (List.map top z_row) :: interchange (List.map bot z_row);;

(* matrix multiplication *)
let matrix_mult x y =
  failwith "not implemented yet"