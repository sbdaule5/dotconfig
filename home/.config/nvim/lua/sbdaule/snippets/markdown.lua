-- add snippets for Obsidian callouts
local ls = require 'luasnip'
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require('luasnip.extras').lambda
local rep = require('luasnip.extras').rep
local p = require('luasnip.extras').partial
local m = require('luasnip.extras').match
local n = require('luasnip.extras').nonempty
local dl = require('luasnip.extras').dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local types = require 'luasnip.util.types'
local conds = require 'luasnip.extras.conditions'
local conds_expand = require 'luasnip.extras.conditions.expand'

local function addCalloutSnippets(callouts)
  vim.inspect(callouts)
  -- individual snippets
  for k, v in pairs(callouts) do
    if not v.nosnippet then
      ls.add_snippets('markdown', {
        s(k, {
          t { '> ' .. v.raw .. '' },
          i(1),
          t { '', '> ' },
          i(2),
        }),
        s(k, {
          t { '> ' .. v.raw .. ' ' },
          i(1),
        }),
      })
    end
  end

  local raws = {}
  for _, v in pairs(callouts) do
    table.insert(raws, t(v.raw))
  end

  -- unified snippet
  ls.add_snippets('markdown', {
    s('callouts', {
      t { '> ' },
      c(1, raws),
      t { ' ' },
      i(2),
      t { '', '> ' },
      i(3),
    }),
  })
end

local function filename_to_title(filename)
  local parts = vim.split(filename, '/')
  local name = vim.split(parts[#parts], '.md')[1]
  return name
end


local function addFrontmatterSnippets()
  -- frontmatter snippet
  ls.add_snippets('markdown', {
    s(
      'frontmatter-project',
      fmta(
        [[
---
title: <title>
date: <date>
author: Shubham <<sbdaule5@gmail.com>>
type: project-<subtype><status>
---

<eos>]],
        {
          title = f(function()
            return filename_to_title(vim.fn.expand '%')
          end),
          date = f(function()
            return os.date '%Y-%m-%d'
          end),
          subtype = c(1, {
            t 'task',
            t 'design',
            t 'index',
          }),
          status = d(2, function(args)
            local subtype = args[1][1]
            local node = nil
            if subtype == 'task' then
              node = {
                t { '', 'status: ' },
                c(1, {
                  t 'idea',
                  t 'todo',
                  t 'wip',
                  t 'testing',
                  t 'done',
                  i(2),
                }),
              }
            else
              node = t ''
            end
            return sn(nil, node)
          end, { 1 }),
          eos = i(0),
        }
      )
    ),
  })
end


return {
  addCalloutSnippets = addCalloutSnippets,
  addFrontmatterSnippets = addFrontmatterSnippets,
}
