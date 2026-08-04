-- Enable Language Server Protocols (LSP)
vim.lsp.enable('tsserver')

-- TypeScript.
vim.lsp.config('tsserver', {
  -- Ensure this has been installed globally via npm.
  cmd = {'typescript-language-server', '--stdio'},
  filetypes = { 'typescript' },
  -- This is a hint to tell nvim to find the project root from a file within the tree.
  root_dir = vim.fs.root(0, {'package.json', '.git'})
})
