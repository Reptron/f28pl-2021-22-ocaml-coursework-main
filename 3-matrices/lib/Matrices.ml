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

let rec length_of_matrix: 'a list -> int = fun y ->
match y with [] -> 0 |
(y :: rem) -> length_of_matrix rem + 1;;

(* test whether a list of lists of integers represents a matrix.  The
   length of each row should be equal.*)
let is_matrix x = let rec is_matrix_step : int list list -> bool = 
fun x -> match x with
[] -> true | [[]] -> true | a :: [] -> true | a :: b :: c ->
if (length_of_matrix a == length_of_matrix b) then is_matrix_step (b :: c) else false
in is_matrix_step x;;

(* function matrixshape takes the matrix, and calculates the number of
   columns and rows *)
let matrix_shape x =
  match x with [] -> (0,0) |
  [[]] -> (0,1) |
  (x :: rem) -> (length_of_matrix x, 1 + length_of_matrix rem)

let rec addition: int_seq -> int_seq -> int_seq = fun x y ->
match x, y with [], _ -> [] |
_, [] -> [] |
r1 :: rem, r2 :: rem2 -> (r1 + r2) :: (addition rem rem2);;

(* matrix addition *)
let [@warning "-8"] rec matrix_add x y =
match x,y with [],[] -> [[]] |
(x :: bott, y :: bott2) -> (addition x y) :: (matrix_add bott bott2)

(* matrix multiplication *)
let matrix_mult x y =
  let rec multiplication: int_seq list -> int_matrix -> int_matrix -> int_matrix =
  fun acc matrix matrix2 ->
  match matrix, matrix2 with (matrix_rows, matrix2_rows) ->
  match matrix_rows, matrix2_rows with [], [] -> acc |
  [], matrix2_rows -> acc |
  matrix_rows, [] -> [] |
  (matrix_rows :: matrix_rows_rem), (matrix2_cols) -> multiplication(acc @ ([dot (([matrix_rows])) ((matrix2_cols))])) (matrix_rows_rem) (matrix2_cols)
  
  int multiplication [] x y;;