(* Coursework template

   My Name here, My UserID          <--- confirm who you are 
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

(* Write an essay on the OCaml type system. Be clear, to-the-point, and
   concise. Convince your marker that you understand:

   - Function type signatures.
   - Polymorphism.
   - List types and tuple types (and their differences).
   - OCaml pattern-matching on values (e.g. integers) and structures (e.g. lists).
   - Named and anonymous functions.
   - Recursive functions.
   - Unit and property based tests.

   Include short code-fragments (as in the lectures) to illustrate
   your observations.
   Do this in a literate programming style to include executable code
   to demonstrate the concepts you're writing about, e.g. *)

(* Ocaml is a programming language that supoorts a funtional style. A function maps an input to an output. The same input produces 
the same output, meaning extra infromation is non-exsistant and unmainatained, by functions, between usages of the function.

A function signature is a signature that defines a function. A signature is determined automatically by the compiler based on how the 
function handles arguments. An example of a function type signature is:

   int -> int -> int

Polymorphism is well-known to be used in object-oriented programming. There are three types of polymorphism:
   Ad hoc Polymorphism: A type that permits a function to designate multiple, potentially diverse implementations based on a small number 
   of individually stated types and combinations.
   Parmetric Polypmorphism: A type that allows a function to be designed generically so that it can handle values in the same way regardless 
   of type.
   Subtype/Inclusion Polymorphism: A type that allows a function to take an object of a specific type T but also perform appropriately when 
   supplied an object of a subtype S.

   Ad hoc example:
      float -> float -> float

   Parametric example:
      'a -> 'a list -> 'a list

   Subtype/Incluse example: 
   (We see ab as a subtype of abc. We also see that x has the type ab, so ab can be used in place of x and vice versa)
      # type ab = [ `A | `B ];;
      type ab = [ `A | `B ]
      # type abc = [`A | `B | `C ];;
      type abc = [ `A | `B | `C ]
      # let x : ab = `A;;
      val x : ab = `A
      # let y : abc = x;;
      # let y : abc = (x :> abc);;

List types and tuple types (and their differences):

 *) 

(* The following function adds two numbers together. It has types ... *)

let add (x:int) (y:int) : int = x + y

(* The following function... *)
