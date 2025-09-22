from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class Scheme(ColorScheme):
    progress_bar_color = 107

    def use(self, context):
        fg, bg, attr = default_colors

        base      = 235
        surface   = 236
        overlay   = 239
        muted     = 103
        subtle    = 246
        text      = 252
        love      = 168
        gold      = 179
        pine      = 65
        foam      = 109
        iris      = 141
        highlight = 60

        if context.reset:
            return default_colors

        if context.in_browser:
            fg = text
            if context.selected:
                attr = reverse
            if context.empty or context.error:
                fg = love
            if context.border:
                fg = subtle
            if context.media:
                fg = foam
            if context.image:
                fg = gold
            if context.video:
                fg = iris
            if context.audio:
                fg = pine
            if context.document:
                fg = text
            if context.directory:
                fg = foam
                attr |= bold
            if context.executable and not context.directory:
                fg = pine
                attr |= bold
            if context.link:
                fg = iris
            if context.marked:
                fg = love
                attr |= bold

        if context.in_titlebar:
            attr |= bold
            if context.hostname:
                fg = love if context.bad else foam
            elif context.directory:
                fg = foam
            elif context.tab:
                fg = iris if context.good else gold
            elif context.link:
                fg = muted

        if context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = pine
                elif context.bad:
                    fg = love
            if context.marked:
                attr |= bold | reverse
                fg = love
            if context.message:
                fg = love if context.bad else text

        return fg, bg, attr

