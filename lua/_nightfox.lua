local nightfox = require("nightfox")

-- This function set the configuration of nightfox. If a value is not passed in the setup function
-- it will be taken from the default configuration above
nightfox.setup(
    {
        fox = "nordfox", -- change the colorscheme to use nordfox
        styles = {
            keywords = "bold", -- change style of keywords to be bold
            functions = "italic,bold" -- styles can be a comma separated list
        },
        inverse = {
            match_paren = true -- inverse the highlighting of match_parens
        },
        colors = {
            bg = "#202020"
        }
    }
)

-- Load the configuration set above and apply the colorscheme
nightfox.load()
