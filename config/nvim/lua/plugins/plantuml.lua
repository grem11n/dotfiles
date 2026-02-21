-- Render PlantUML diagrams in Neovim
-- :PlantUML
return {
  'https://gitlab.com/itaranto/plantuml.nvim',
  version = '*',
  config = function() require('plantuml').setup() end,
}
