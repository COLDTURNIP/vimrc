local function set_key_behavior(motion, direction, config)
  local directions = require("hop.hint").HintDirection
  config["directions"] = directions[direction]
  require("hop")[motion](config)
end

local M = {
  keys = {
    {
      "f",
      function() set_key_behavior("hint_char1", "AFTER_CURSOR", {current_line_only = true}) end,
      mode = {"n", "v", "o"},
      desc = "hop to inline position",
    },
    {
      "F",
      function() set_key_behavior("hint_char1", "BEFORE_CURSOR", {current_line_only = true}) end,
      mode = {"n", "v", "o"},
      desc = "hop to inline position",
    },
    {
      ",,b",
      function() set_key_behavior("hint_words", "BEFORE_CURSOR", {}) end,
      mode = {"n", "v", "o"},
      desc = "hop to word backward",
    },
    {
      ",,w",
      function() set_key_behavior("hint_words", "AFTER_CURSOR", {}) end,
      mode = {"n", "v", "o"},
      desc = "hop to word forward",
    },
    {
      ",,k",
      function() set_key_behavior("hint_vertical", "BEFORE_CURSOR", {}) end,
      mode = {"n", "v", "o"},
      desc = "hop to line backward",
    },
    {
      ",,j",
      function() set_key_behavior("hint_vertical", "AFTER_CURSOR", {}) end,
      mode = {"n", "v", "o"},
      desc = "hop to line forward",
    },
  },
  config = function() require("hop").setup {} end,
}

return M
