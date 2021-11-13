local awful = require('awful')
local gears = require('gears')
local icons = require('theme.icons')
local apps = require('configuration.apps')

local tags = {
  {
    icon = icons.social,
    type = 'social',
    defaultApp = apps.default.social,
    screen = 1
  },
  {
    icon = icons.chrome,
    type = 'chrome',
    defaultApp = apps.default.browser,
    screen = 2
  },
  {
    icon = icons.code,
    type = 'code',
    defaultApp = apps.default.editor,
    screen = 1
  },
  {
    icon = icons.office,
    type = 'office',
    defaultApp = apps.default.office,
    screen = 1
  },
  {
    icon = icons.lab,
    type = 'labvm',
    defaultApp = apps.default.rofi,
    screen = 1
  },
  {
    icon = icons.media,
    type = 'media',
    defaultApp = apps.default.media,
    screen = 1
  }
}

awful.layout.layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.max,
  awful.layout.suit.floating
}

--awful.screen.connect_for_each_screen(
--  function(s)
--  end
--)

for i, tag in pairs(tags) do
  awful.tag.add(
    i,
    {
      name = tag.type,
      icon = tag.icon,
      icon_only = true,
      screen = tag.screen,
      layout = awful.layout.suit.tile,
      gap_single_client = false,
      gap = 4,
      defaultApp = tag.defaultApp,
      selected = i <= 2
    }
  )
end
sharedtaglist = root.tags()

_G.tag.connect_signal(
  'property::layout',
  function(t)
    local currentLayout = awful.tag.getproperty(t, 'layout')
    if (currentLayout == awful.layout.suit.max) then
      t.gap = 0
    else
      t.gap = 4
    end
  end
)
