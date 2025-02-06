(derived_type_definition) @class.outer

(interface) @class.outer

((interface
  (interface_statement)
  .
  (_) @_start
  (_)? @_end
  .
  (end_interface_statement))
  (#make-range! "class.inner" @_start @_end))

(function) @function.outer

((function
  (function_statement)
  .
  (_) @_start
  (_)? @_end
  .
  (end_function_statement))
  (#make-range! "function.inner" @_start @_end))

(subroutine) @function.outer

((subroutine 
   (subroutine_statement)
   .
   (_) @_start
   (_)? @_end
   .
   (end_subroutine_statement))
   (#make-range! "function.inner" @_start @_end))

(module_procedure) @function.outer

((module_procedure
   (module_procedure_statement)
   .
   (_) @_start
   (_)? @_end
   .
   (end_module_procedure_statement))
   (#make-range! "function.inner" @_start @_end))

(do_loop_statement) @loop.outer

(if_statement) @conditional.outer

(if_statement
   (_)
   .
   (_) @_start
   (_)? @_end
   .
   [
    (end_if_statement)
    (elseif_clause)
    (else_clause)
   ]
   (#make-range! "conditional.inner" @_start @_end))

(select_type_statement) @conditional.outer
