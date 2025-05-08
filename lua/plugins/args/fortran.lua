local M = {}

M.lsp_cmd = {
  "fortls",
  "--lowercase_intrinsics",
  "--notify_init",
  "--source_dirs",
  os.getenv("dropbox") .. "/easifem/easifem-base/src/**",
  os.getenv("dropbox") .. "/easifem/easifem-classes/src/**",
  -- os.getenv("dropbox") .. "/easifem/elasticity/src/**",
  -- os.getenv("dropbox") .. "/easifem/acoustic/src/**",
  os.getenv("HOME") .. "/.easifem/src/tomlf/src/**",
  "--hover_signature",
  "--hover_language",
  "fortran",
  "--use_signature_help",
}

M.linter = {
  "-c",
  "-fsyntax-only",
  "-cpp",
  -- "-fdiagnostics-plain-output",
  "-Wunused-variable",
  "-Wunused-dummy-argument",
  "-Wno-c-binding-type",
  "-Wall",
  "-I",
  os.getenv("HOME") .. "/.easifem/lint/include/",
  "-I",
  os.getenv("HOME") .. "/.easifem/install/base/include/",
  "-I",
  os.getenv("HOME") .. "/.easifem/install/classes/include/",
  "-I",
  os.getenv("HOME") .. "/.easifem/install/kernels/include/",
  "-I",
  os.getenv("HOME") .. "/.easifem/install/tomlf/include/toml-f/modules/",
  "-J",
  os.getenv("HOME") .. "/.easifem/lint/include/",
  "-DDEBUG_VER",
}

local _args = {
  "--line-length",
  "78",
  "--indent",
  "2",
  "--strict-indent",
  "--disable-indent-mod",
  "--whitespace",
  "2",
  "--whitespace-comma",
  "--whitespace-assignment",
  "--enable-decl",
  "--whitespace-decl",
  "--whitespace-relational",
  "--whitespace-logical",
  "--whitespace-multdiv",
  "--whitespace-print",
  "--whitespace-intrinsics",
  "--strip-comments",
}

M.formatter_sub = _args
M.formatter = vim.list_extend({
  "--case",
  "2",
  "2",
  "2",
  "2",
}, _args)

return M
