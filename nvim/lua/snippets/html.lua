local ls = require("luasnip") -- 加载 LuaSnip
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("html", {
    s("!", {
        t({
            "<!DOCTYPE html>",
            "<html lang=\"zh-CN\">",
            "<head>",
            "    <meta charset=\"UTF-8\">",
            "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">",
            "    <title>Document</title>",
            "</head>",
            "<body>",
            "    ",
            "</body>",
            "</html>",
        }),
    }),
})
