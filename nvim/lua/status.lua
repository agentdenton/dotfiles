local gl = require('galaxyline')
local gls = gl.section
local condition = require('galaxyline.condition')
local vcs = require('galaxyline.provider_vcs')
local buffer = require('galaxyline.provider_buffer')
local fileinfo = require('galaxyline.provider_fileinfo')
local diagnostic = require('galaxyline.provider_diagnostic')
local lspclient = require('galaxyline.provider_lsp')
local icons = require('galaxyline.provider_fileinfo').define_file_icon()

local colors = {
    black     = '#282828',
    bblack    = '#928374',
    red       = '#cc241d',
    bred      = '#fb4934',
    green     = '#98971a',
    bgreen    = '#b8bb26',
    yellow    = '#d79921',
    byellow   = '#fabd2f',
    blue      = '#458588',
    bblue     = '#83a598',
    mangenta  = '#b16286',
    bmangenta = '#d3869b',
    cyan      = '#689d6a',
    bcyan     = '#8ec07c',
    white     = '#a89984',
    bwhite    = '#ebdbb2',
    transp    = 'NONE',
}

icons['man'] = {colors.green, ''}

gls.left = {
    {
        Mode = {
            provider = function()
                local alias = {n = 'NORMAL', i = 'INSERT', c = 'COMMAND', V= 'VISUAL', [''] = 'V-BLOCK'}
                if not condition.hide_in_width() then
                    alias = {n = 'N', i = 'I', c = 'C', V= 'V', [''] = 'V'}
                end
                return string.format('   %s ', alias[vim.fn.mode()])
            end,
            highlight = {colors.black, colors.yellow, 'bold'},
        }
    },
    {
        FileName = {
            provider = function()
                return string.format('  %s ', fileinfo.get_current_file_name())
            end,
            condition = condition.buffer_not_empty,
            highlight = {colors.bwhite, colors.black}
        }
    },
    {
        Blank = {
            provider = function() return '' end,
            highlight = {colors.transp, colors.transp}
        }
    }
}

gls.right = {
    {
        FileType = {
            provider = function() return string.format(' %s ', buffer.get_buffer_filetype()) end,
            condition = function() return buffer.get_buffer_filetype() ~= '' end,
            highlight = {colors.white, colors.black}
        }
    },
    {
        FileFormat = {
            provider = function() return string.format('   %s ', fileinfo.get_file_format()) end,
            condition = condition.hide_in_width,
            highlight = {colors.black, colors.white}
        }
    },
    {
        FileEncode = {
            provider = function() return string.format('   %s ', fileinfo.get_file_encode()) end,
            condition = condition.hide_in_width,
            highlight = {colors.black, colors.bblack}
        }
    },
    {
        LineInfo = {
            provider = function() return string.format('   %s  ', fileinfo.line_column()) end,
            highlight = {colors.black, colors.yellow}
        }
    },
}
