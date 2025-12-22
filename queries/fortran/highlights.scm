(identifier) @variable
(number_literal) @number
(boolean_literal) @boolean
(string_literal) @string
(comment) @comment

[
 (intrinsic_type)
 "allocatable"
 "attributes"
 "device"
 "dimension"
 "endtype"
 "global"
 "grid_global"
 "host"
 "import"
 "in"
 "inout"
 "intent"
 "optional"
 "out"
 "pointer"
 "type"
 "value"
 ] @type

[
 "contains"
 "private"
 "public"
 ] @include

[
 (none)
 "implicit"
 ] @attribute

[
  "bind"
  "call"
  "class"
  "continue"
  "cycle"
  "endenum"
  "enum"
  "enumerator"
  "equivalence"
  "exit"
  "format"
  "goto"
  "include"
  "only"
  "parameter"
  "print"
  "read"
  "return"
  "stop"
  "use"
  "write"
  "non_overridable"
] @keyword

(default)@keyword.default

[
(procedure_statement)
(procedure_qualifier)
] @keyword.function

[
  (program_statement)
  (end_program_statement)
 ] @keyword.program

[
  (function_statement)
  (end_function_statement)
 ] @keyword.function

[
  (subroutine_statement)
  (end_subroutine_statement)
 ] @keyword.subroutine

[
  (module_statement)
  (end_module_statement)
 ] @keyword.module

[
  (submodule_statement)
  (end_submodule_statement)
 ] @keyword.submodule

[
  (module_procedure_statement)
  (end_module_procedure_statement)
 ] @keyword.module_procedure


[
  (interface_statement)
  (end_interface_statement)
 ] @keyword.interface

"return" @keyword.return

[
 "else"
 "elseif"
 "elsewhere"
 "endif"
 "endwhere"
 "if"
 "then"
 "where"
 ] @keyword.ifelse

[
  "selectcase"
  "case"
  "endselect"
  "selecttype"
  "classis"
  "typeis"
 ] @keyword.case

[
 "do"
 "enddo"
 "forall"
 "while"
 ] @keyword.repeat

[
 "*"
 "+"
 "-"
 "/"
 "="
 "<"
 ">"
 "<="
 ">="
 "=="
 "/="
 ] @keyword.operator

[
 "\\.and\\."
 "\\.not\\."
 "\\.or\\."
 "\\.lt\\."
 "\\.gt\\."
 "\\.ge\\."
 "\\.le\\."
 "\\.eq\\."
 "\\.eqv\\."
 "\\.neqv\\."
 ] @keyword.operator

;; Brackets
[
 "("
 ")"
 "["
 "]"
 "<<<"
 ">>>"
 ] @keyword.bracket

;; Delimiter
[
 "::"
 ","
 "%"
 ] @keyword.delimiter

(parameters
  (identifier) @parameter)

(program_statement
  (name) @namespace.program)

(end_program_statement
  (name) @namespace.program)

(module_statement
  (name) @namespace.module)

(end_module_statement
  (name) @namespace.module)

(submodule_statement
  (module_name) (name) @namespace.submodule)

(end_submodule_statement
  (name) @namespace.submodule)

(function_statement
  (name) @namespace.function)

(end_function_statement
  (name) @namespace.function)

(subroutine_statement
  (name) @namespace.subroutine)

(end_subroutine_statement
  (name) @namespace.subroutine)

(module_procedure_statement
  (name) @namespace.module_procedure)

(end_module_procedure_statement
  (name) @namespace.module_procedure)

(subroutine_call
  (identifier) @namespace.subroutine_call)

(keyword_argument
  name: (identifier) @namespace.keyword_args)

(derived_type_member_expression
  (type_member) @namespace.property)

